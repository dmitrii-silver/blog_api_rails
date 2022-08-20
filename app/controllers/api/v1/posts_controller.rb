module Api
  module V1
    class PostsController < ApplicationController
      
      def index
        @posts = Post.paginate(
          page: params[:page],
          per_page: params[:per_page]
        ).order('published_at DESC')
        
        render json: @posts

        set_response_heders
      end

      def show
        @post = Post.find(params[:id])
        render json: @post  
      end  

      def create
        @user = User.create!(user_params)
        @post = Post.new(post_params.merge(author: @user.id))
        if @post.save
          render json: @post, status: :created
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:nickname, :email, :password)
      end

      def post_params
        params.require(:post).permit(:title, :body, :user, :published_at)
      end

      def set_response_heders
        response.headers["posts"]  = @posts.count.to_s
        response.headers["pages"]  = @posts.total_pages.to_s
      end
    end
  end
end
