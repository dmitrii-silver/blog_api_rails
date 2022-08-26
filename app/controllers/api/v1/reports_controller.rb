module Api
  module V1
    class ReportsController < ApplicationController
      before_action :set_params, only: [:by_author]

      def by_author
        if User.send_report(@start_date, @end_date, @email)
          render json: { "message" => "Report generation started" }
        else
          render json: { "errors" => "Report can't send, format date: 'DD/MM/YYYY'" },
          status: 404
        end
      end

      private

      def set_params
        @start_date = params[:start_date] || ""
        @end_date   = params[:end_date]   || ""
        @email      = params[:email]      || ""
      end
    end
  end
end
