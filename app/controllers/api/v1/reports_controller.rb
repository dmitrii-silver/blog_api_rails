module Api
  module V1
    class ReportsController < ApplicationController
      def by_author
        if ReportMailer.report.deliver_later
          render json: { "message" => "Report generation started" }
        else
           render json: { "errors" => "Report can't send, format date: 'DD/MM/YYYY'" },
        status: 404
      end
      end
    end
  end
end
