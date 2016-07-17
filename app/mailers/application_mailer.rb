# base app mailer
class ApplicationMailer < ActionMailer::Base

  default from: 'admin@larisni.com'
  layout 'mailer'

  helper ApplicationHelper

end
