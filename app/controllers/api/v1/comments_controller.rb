module Api
  module V1
    class CommentsController < ApplicationController
      def index
        @comments = Comment.all
        render json: @comments
      end

      def show
        @comment = Comment.find(params[:id])
        render json: @comment 
      end  

      def create
        user = User.create!(user_params)
        post = Post.find(params[:post_id])
        comment = Comment.create(comment_params.merge(autor: user.id).merge(post: post_id))
        if comment.save
          render json: comment, status: :created
        else
          render json: comment.errors, status: :unprocessable_entity
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
