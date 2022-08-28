module Api
  module V1
    class CommentsController < ApplicationController
      # before_action :authenticate_api_v1_user!, only: [:create]
      
      def index
        @comments = Comment.all
        render json: @comments
      end

      def show
        @comment = Comment.find(params[:id])
        render json: @comment 
      end  

      def create
        # @comment = Comment.create(post_params.merge(author: current_api_v1_user.id))
        @user = User.find(params[:user_id])
        @comment = @user.comments.build(comment_params.merge(autor: @user.id))
        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      private

      def comment_params
        params.require(:comment).permit(:body, :user, :post, :author, :published_at )
      end

      def user_params
        params.require(:user).permit(:nickname, :email, :password)
      end
    end
  end
end
