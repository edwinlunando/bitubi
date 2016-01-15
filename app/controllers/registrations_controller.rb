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
    # UserMailer.welcome(resource).deliver_now
    gibbon = Gibbon::Request.new
    if resource.supplier?
      list_id = ENV['MAILCHIMP_VENDOR_ID']
    else
      list_id = ENV['MAILCHIMP_RESELLER_ID']
    end
    gibbon.lists(list_id).members.create(body: {email_address: resource.email, status: 'subscribed', merge_fields: {FNAME: resource.first_name, LNAME: resource.last_name}})
    root_path
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :address,
                                 supplier_attributes: [:address, :bank_account_number])
  end

end
