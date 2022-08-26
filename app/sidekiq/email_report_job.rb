class EmailReportJob
  include Sidekiq::Job

  def perform(*args)
    ReportMailer.report.deliver_later
  end
end
