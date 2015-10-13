# Main controller for pretty much everything
class HomeController < ApplicationController

  before_action :authenticate_user!, only: [:topup, :topup_credit, :cart, :remove_from_cart]

  def index
    @categories = Category.all
    @products = Product.page(params[:page])
    render controller: :products, action: :index
  end

  def login
    return redirect_to root_path if user_signed_in?
    render('devise/sessions/new')
  end

  def register
    render('devise/registrations/new')
  end

  def create_user
    byebug
    @user = User.new(user_params)
    @user.role = 'user'
    if @user.save
      flash[:success] = 'User baru dibuat!'
      redirect_to root_path
    else
      render action: :auth
    end
  end

  def send_contact
    @contact_form = ContactForm.new(contact_params)

    @contact_form.deliver if @contact_form.valid?

    render :contact
  end

  def contact
    @contact_form = ContactForm.new
  end

  private

  def user_params
    params.require(:user).require(:email, :password, :password_confirmation, :phone_number)
  end

  def contact_params
    params.require(:contact_form).require(:name, :email, :message)
  end

end
