class UsersController < ApplicationController
    before_action :authorized, only: [:persist]
  
    
    def index
      @users = User.all
      render json: @users 

    end

    def show
      @user = User.find_by(id: params[:id])
      render json: @user
    end

    # def posts
    #   #this will be the custom route for the user posts
    
    #   @user = User.find_by(id: params[:id])
    #   @post = Post.find_or_create_by(@post.id)
    #   UserPost.create(user: @user.id, post: @post.id)
    #   render json: @user
    # end


    def create
      @user = User.create(user_params)
    
        if @user.valid?
          infoToSaveInBox = {user_id: @user.id}
          auth_token = encode_token(infoToSaveInBox)
          render json: {user: UserSerializer.new(@user), token: auth_token}
        else
          render json: {error: @user.errors.full_messages}
        end
      end

      def create_user_post
        @user = User.find_by(id: params[:id])
        @post = Post.find_by(id: params[:id])
       #now that we've found the user, post to user posts
        UserPost.create(user: @user.id, post: params[:id] )
        render json: @user
      end

      def my_posts
        @user = User.find_by(id: params[:id])
        
      end

    
      def persist
        infoToSaveInBox = {user_id: @user.id}
        auth_token = encode_token(infoToSaveInBox)
        render json: {user: UserSerializer.new(@user), token: auth_token}
      end
    
    
      def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          infoToSaveInBox = {user_id: @user.id}
          auth_token = encode_token(infoToSaveInBox)
          render json: {user: UserSerializer.new(@user), token: auth_token}
          # byebug
        else
          render json: {error: "INCORRECT USERNAME OR PASSWORD"}
        end
      end
      

      def signup
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          infoToSaveInBox = {user_id: @user.id}
          auth_token = encode_token(infoToSaveInBox)
          render json: {user: UserSerializer.new(@user), token: auth_token}
        else
          render json: {error: "INCORRECT USERNAME OR PASSWORD"}
        end
      end
    
      private
    
      def user_params
        params.require(:user).permit(:username, :password)
      end
    
end
