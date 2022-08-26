class ReportMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mailer.report.subject
  #
  def report
    @greeting = "Hi"

    mail to: "dmitrii.serebriakov@gmail.com", subject: "My Mail"
  end
end
