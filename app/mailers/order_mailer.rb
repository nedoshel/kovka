class OrderMailer < ActionMailer::Base
  # default from: "info@kovanye.su"

  def new_order(feedback)
    @feedback = feedback
    # @order = order
    mail_to = Templates.send(:mail_to) rescue nil
    mail_to ||= "nedoshel@yandex.ru"
    # mails_to = mail_to.split(";").map{ |e| e.strip } << "nedoshel@yandex.ru"
    mails_to = mail_to.split(";").map{ |e| e.strip }
    from = "#{@feedback.name} <info@kovanye.su>"
    # mail(from: @order.email, to: mails_to[0], bcc: mails_to.drop(1), subject: @order.title)
    mail(
      from: from,
      to: mails_to[0],
      bcc: mails_to.drop(1),
      reply_to: @feedback.email,
      subject: "Заявка на #{@feedback.product.article} от #{@feedback.name}"
    )
  end

end
