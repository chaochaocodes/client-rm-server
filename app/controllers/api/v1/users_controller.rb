class Api::V1:: UsersController < ApplicationController
    # skip_before_action :authorized, only: [:create]
    
    def profile
        render json: {user: UserSerializer.new(current_user)}, status: :accepted 
    end
    
    def create
      @user = User.create(username: params[:user][:user][:username], password: params[:user][:user][:password])
      if @user.valid?
        @token = encode_token(user_id: @user.id)
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: @user.errors.full_messages }, status: :not_acceptable
      end
    end

    def destroy
        user = User.find(params[:id])
        if user.valid?
          user.destroy
          puts "USER DELETED!"
        else
          puts "User not valid"
        end
    end
     
    def save_listing
      listing = Listing.create(params[:listing][:result][0])
      user = User.find(params[:user_id])
      user.listings << listing
    end

    private
    def user_params
      params.require(:user).permit(:username, :password, :pwconfirm)
    end
    
    
    # def show 
    #     user = User.find(params[:id])
    #     render json: user+++
    # end

    # def edit
    #     user = User.find(params[:id])
    # end

    # def update
    #     user = User.find(params[:id])
    #     user.update(name: params["name"], password: params["password"])
    #     render json: user
    # end
end
