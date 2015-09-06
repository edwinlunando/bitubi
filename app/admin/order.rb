ActiveAdmin.register Order do

  permit_params :total, :special_instruction, :state

  index do
    selectable_column
    id_column
    column :total
    column :special_instruction
    column :state
    actions
  end

  filter :active

  form do |f|
    f.inputs "Admin Details" do
      f.input :total
      f.input :special_instruction
      f.input :state, collection: Order.states
      f.input :user
      f.has_many :line_items, heading: 'Products' do |a|
        a.input :product
        a.input :quantity
      end
    end
    f.actions
  end


end
