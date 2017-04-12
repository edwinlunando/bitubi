# == Schema Information
#
# Table name: orders
#
#  id                      :integer          not null, primary key
#  total                   :decimal(10, )
#  special_instruction     :text(65535)
#  state                   :string(255)
#  user_id                 :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  address_id              :integer
#  state_shipment_price_id :integer
#  payment_time            :datetime
#  receipt_number          :string(255)
#  transfer_time           :datetime
#  transferred             :boolean
#  cancel_time             :datetime
#  shipment_price_value    :decimal(10, )
#  shipment_price_code     :string(255)
#  shipment_price_courier  :string(255)
#  shipment_price_name     :string(255)
#  shipment_price_etd      :string(255)
#

class Order < ActiveRecord::Base

  # Relation
  has_many :line_items, dependent: :destroy
  accepts_nested_attributes_for :line_items
  has_many :products, through: :line_items
  has_many :suppliers, through: :products, source: :user
  has_many :adjustments
  belongs_to :address
  belongs_to :user
  belongs_to :state_shipment_price

  attr_accessor :manual_text, :outputter

  # scope
  scope :vendor, -> { where(state: [:delivery, :done, :failed]) }
  scope :created, -> { order(created_at: :desc) }
  scope :updated, -> { order(updated_at: :desc) }

  # Method

  def self.admin
    where(state: [:payment, :delivery, :done, :failed])
  end

  def finish_order
    line_items.each do |line_item|

      line_item.product.stock -= line_item.quantity
      line_item.product.published = false if line_item.product.stock == 0

      line_item.product.save

    end
  end

  def cancel_order
    if state == 'delivery' || state == 'payment'
      cancel
      self.cancel_time = Time.zone.now
      user.credit += total
      save && user.save
    else
      false
    end
  end

  # State
  include AASM

  def self.states
    [:cart, :address, :payment, :delivery, :done, :failed]
  end

  def state_simple
    if state == 'cart'
      'Di dalam keranjang'
    elsif state == 'address'
      'Masukkan alamat'
    elsif state == 'payment'
      'Pembayaran'
    elsif state == 'delivery'
      'Masukkan nomor resi'
    elsif state == 'done'
      'Selesai'
    elsif state == 'failed'
      'Batal'
    end
  end

  aasm column: :state do # default column: aasm_state

    state :cart, initial: true
    state :address
    state :payment
    state :delivery
    state :done
    state :failed

    event :checkout do
      transitions from: :cart, to: :address
    end

    event :addressing do
      transitions to: :payment
    end

    event :pay do
      transitions to: :delivery
    end

    event :deliver do
      before do
        finish_order
      end
      transitions to: :done
    end

    event :cancel do
      transitions to: :failed
    end

  end

  def transfer
    ActiveRecord::Base.transaction do
      # send money to supplier first
      supplier = suppliers.first
      supplier.credit += total
      supplier.save

      # send money to reseller
      if bank_amount.present?
        user_commision = commision
        user.credit += user_commision if user_commision > 0
        user.save
      end

      # save timestamp
      self.transferred = true
      self.transfer_time = Time.zone.now
      save
    end
  end

  def same_vendor?(line_item)
    return true if suppliers.blank?
    suppliers.ids.include?(line_item.product.user_id)
  end

  def total_without_shipment
    line_items.inject(0) { |result, element| result + element.price }
  end

  def total
    total_without_shipment + shipment_price
  end

  def adjustments_total
    adjustments.inject(0) { |result, element| result + element.amount }
  end

  def total_with_adjustments
    total + adjustments_total
  end

  def total_weight_gram
    line_items.inject(0) { |result, element| result + (element.quantity * element.product.weight) }
  end

  def total_weight
    line_items.inject(0) { |result, element| result + (element.quantity * element.product.weight) } / 1000.0
  end

  def display_weight
    weight = total_weight
    return 1.0 if weight < 1.0

    if weight % 1 < 0.3
      weight = weight.floor
    else
      weight = weight.ceil
    end
    weight
  end

  def commision
    bank_amount - total
  end

  def shipment_price
    if shipment_price_value.present?
      return shipment_price_value
    elsif state_shipment_price.present?
      weight = display_weight
      return weight * state_shipment_price.price
    else
      return 0
    end

    # shipment_price_value.present? ? shipment_price_value : 0
  end

  def valid_with_credit
    user.credit < total
  end

  def confirm
    self.pay
    save
  end

  def parse
    ActiveRecord::Base.transaction do
      self.save
      self.state = :payment
      lines = manual_text.lines.map(&:strip)
      counter_line = 0

      # line 1 - receiver_name
      self.address = Address.new
      self.address.receiver_name = lines[counter_line]
      counter_line += 1

      # line 2 - receiver_phone
      self.address.receiver_phone = lines[counter_line]
      counter_line += 1

      # line 3 - name
      self.address.name = lines[counter_line]
      counter_line += 1

      # line 4 - state
      # byebug
      # states = State.where("lower(name) LIKE ?", "%#{ lines[3].downcase }%")
      # self.errors.add(:kecamatan, "tidak ditemukan") if states.count < 1
      # self.address.state = states.first

      # line 5 - zipcode
      self.address.zipcode = lines[counter_line]
      self.errors.add(:kode_pos, "tidak ditemukan") if lines[counter_line].nil?
      counter_line += 1

      # line 6 - sender_name
      self.address.sender_name = lines[counter_line]
      self.errors.add(:nama_pengirim, "tidak ditemukan") if lines[counter_line].nil?
      counter_line += 1

      # line 7 - sender_phone
      self.address.sender_phone = lines[counter_line]
      self.errors.add(:no_hp_pengirim, "tidak ditemukan") if lines[counter_line].nil?
      counter_line += 1

      self.address.save

      # line 8 - bank
      self.bank_transfer = lines[counter_line]
      self.errors.add(:bank_transfer, "tidak ditemukan") if lines[counter_line].nil?
      counter_line += 1

      # line 9 - bank_transfer
      self.bank_amount = lines[counter_line]
      self.errors.add(:jumlah_transfer, "tidak ditemukan") if lines[counter_line].nil?
      counter_line += 1

      # line 10 - kurir OKE/YES/POS
      self.shipment_price_name = lines[counter_line]
      self.errors.add(:kurir, "tidak ditemukan") if lines[counter_line].nil?
      counter_line += 1

      # line 11 - kurir biaya
      self.shipment_price_value = lines[counter_line]
      counter_line += 1

      # line 12 - number of products
      numbers = lines[counter_line].to_i
      counter_line += 1

      i = counter_line
      numbers.times do
        line_item = LineItem.new
        # jumlah barang
        quantity = lines[i].to_i
        i += 1
        # kode barang
        product = Product.find_by(slug: lines[i])
        line_item.quantity = quantity
        line_item.product = product
        line_item.order = self
        self.line_items << line_item
        i += 1
      end

      # line 13 - catatan
      if lines[i].present? # optional
        self.address.special_instructions = lines[i]
      end

      raise ActiveRecord::Rollback if self.errors.count > 0
      # return false if self.errors.count > 0
      self.address.save
      self.save

    end

  end

end
