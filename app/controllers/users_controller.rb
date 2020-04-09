class UsersController < ApplicationController
    before_action :authorized, only: [:persist]
    
    def index
      @users = User.all
      render json: @users
    end

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
