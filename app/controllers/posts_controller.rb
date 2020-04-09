class PostsController < ApplicationController
    # before_action :authorized, only: [:create]

    def create
        @post = Post.create(post_params)
        render json: @post
    end
    # take everything from fetch and do a create post from frontend fetch

    def index
        @posts = Post.all
        render json: @posts
    end

    private
    def post_params
        params.permit(:caption,:content_url)
      end

end
