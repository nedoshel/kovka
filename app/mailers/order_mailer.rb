class OrderMailer < ActionMailer::Base
  default from: "Кузница Terko <info@kovanye.su>"

  def new_order(feedback)
    @feedback = feedback
    # @order = order
    mail_to = Templates.send(:mail_to) rescue nil
    mail_to ||= "nedoshel@yandex.ru"
    # mails_to = mail_to.split(";").map{ |e| e.strip } << "nedoshel@yandex.ru"
    mails_to = mail_to.split(";").map{ |e| e.strip }
    # mail(from: @order.email, to: mails_to[0], bcc: mails_to.drop(1), subject: @order.title)
    mail(
      to: mails_to[0],
      bcc: mails_to.drop(1),
      reply_to: @feedback.email,
      subject: @feedback.subject
    )
  end

end
