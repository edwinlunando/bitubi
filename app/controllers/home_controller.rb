# Main controller for pretty much everything
class HomeController < ApplicationController

  before_action :authenticate_user!, only: [:topup, :topup_credit, :cart, :remove_from_cart]

  def index
    @categories = Category.all
    @products = Product.prioritize.published.includes(:product_images, :category).page(params[:page])
    render controller: :products, action: :index
  end

  def login
    return redirect_to root_path if user_signed_in?
    render('devise/sessions/new')
  end

  def register
    render('devise/registrations/new')
  end

  def register_supplier
    @user = User.new
    @user.build_supplier
  end

  def create_supplier
    @user = User.new(supplier_params)
    @user.active = true
    @user.verified = true
    begin
      gibbon = Gibbon::Request.new
      gibbon.lists(ENV['MAILCHIMP_VENDOR_ID']).members.create(body: { email_address: @user.email, status: 'subscribed' })
    rescue Gibbon::MailChimpError => exception
      Raven.capture_exception(exception)
    end
    return redirect_to root_path, notice: 'Pendaftaran Berhasil. Silakan Cek Email Anda dan Lakukan Konfirmasi Pada Email yang Kami Kirimkan.' if @user.save
    render :register_supplier
  end

  def send_contact
    @contact_form = ContactForm.new(contact_params)

    if @contact_form.valid?
      @contact_form.deliver
      return redirect_to root_path, notice: 'Pesan telah terkirim. Silahkan tunggu balasan dari kami.'
    end

    render :contact
  end

  def contact
    @contact_form = ContactForm.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :phone_number)
  end

  def contact_params
    params.require(:contact_form).permit(:name, :email, :message)
  end

  def supplier_params
    params.require(:user).permit(:email, :password, :password_confirmation, :phone_number,
                                 supplier_attributes: [:name, :description, :address, :bank_account_number])
  end
  
  def template1
  end

  def template2
  end

  def template3
  end

end
