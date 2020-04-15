class PostsController < ApplicationController
    # before_action :authorized
    # before_action :logged_in_user
    # before_action :authorized, except: [:index, :show]
    # before_action :currentUser
    # before_filter :check_token

    def create
        logged_in_user
        @post = Post.create(post_params)
        UserPost.create(post_id: @post.id, user_id: @user.id)
        render json: @post
    end
    
    def news
        # @posts = HTTParty.get("http://newsapi.org/v2/everything?domains=wsj.com&apiKey=#{ENV['google_api_key']}",
        @posts = Post.response
        render json: @posts
    end
    


    # take everything from fetch and do a create post from frontend fetch

    def index
        @posts = Post.all
        render json: @posts
    end

    private
    def post_params
        params.permit(:caption,:content_url,:title,:description,:url_image,:content_body)
        #should i update these or just take in a post object
      end

end
