class Api::V1::AuthController < ApplicationController
    # skip_before_action :authorized, only: [:create]

    #POST /api/v1/login
    def create 
        @user = User.find_by(username: user_login_params["username"])
        if @user && @user.authenticate(user_login_params["password"])
            token = encode_token({user_id: @user.id})
            render json: {user: UserSerializer.new(@user), jwt: token}, status: :accepted
        else 
            render json: {message: 'Invalid username or password'}, status: :unauthorized
        end
    end

    def show  # if token valid, check against db, gives user back
        user = User.find_by(id: current_user)
        # byebug
        if logged_in?  
            render json: {id: user.id, username: user.username}
        else 
            render json: {error: "No user could be found"}, status: :unauthorized
        end
    end

    private
    
    def user_login_params
        params.require(:user).permit(:username, :password)
    end
end