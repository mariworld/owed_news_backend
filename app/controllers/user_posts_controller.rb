class UserPostsController < ApplicationController

  def index
    user_posts = UserPost.all
    render json: user_posts
  end 

    def show
        user_post = UserPost.find(params[:id])
        render json: user_post
    end

    def create
        user_post = UserPost.create(user_post_params)
        redirect_to user_post.post
    end

    def destroy
      # byebug
      @user_post = UserPost.find(params[:id].to_i)
      @user_post.destroy
      render json: user_posts
    end
    
      private
      def user_post_params
        params.require(:user_post).permit(:content, :post_id, :user_id, :post_information)
        # user_attributes:[:username]
      end

end