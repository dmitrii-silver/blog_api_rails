module Api
  module V1
    class ProfilesController < ApplicationController
      # before_action :authenticate_api_v1_user!, only: [:show]

      def new
        @user = User.new
      end

      def show
        @user = User.find(params[:id])
      end
    end
  end
end
