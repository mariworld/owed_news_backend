class AuthorizationController < ApplicationController
    # skip_before_action :authorized, only: [:create]

    def create
      @user = User.find_by(username: params[:user][:username])
    
      if @user && @user.authenticate(params[:user][:password])
        # encode token comes from ApplicationController
        token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), token: token }, status: :accepted
      else
        render json: { message: 'Invalid username or password' }, status: :unauthorized
      end
    end

    # private
    # def user_params
    #   params.require.(:user).permit(:username, :password)
    # end
  end