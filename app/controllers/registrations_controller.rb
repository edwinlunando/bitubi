# devise override registration controller
class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    # @client = Twilio::REST::Client.new
    # @client.messages.create(
    #   from: '+12053796624',
    #   to: resource.phone_number,
    #   body: 'Halo, kamu harus transfer 1 juta ke saya!'
    # )
    UserMailer.welcome(resource).deliver_now
    root_path
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 supplier_attributes: [:address, :bank_account_number])
  end

end
