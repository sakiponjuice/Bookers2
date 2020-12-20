class ThanksMailer < ApplicationMailer
  def send_when_admin_reply(resource)
    @name = resource.name
    mail to: resource.email, subject: 'ご登録ありがとうございます！'
  end
end
