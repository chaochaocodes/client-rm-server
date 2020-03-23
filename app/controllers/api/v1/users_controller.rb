class Api::V1:: UsersController < ApplicationController
    # skip_before_action :authorized, only: [:create]
    
    def profile
        render json: {user: UserSerializer.new(current_user)}, status: :accepted 
    end
    
    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token(user_id: @user.id)
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end
     
    private
    def user_params
      params.require(:user).permit(:username, :password)
    end
    
    # # def save_search
    # #     email = Email.find_or_create_by(address: params["address"], user_id: params["id"])
    # #     user = User.find(params["id"])
    # #     user.emails << email
    # #     params["breaches"].map do |breach|
    # #         email.breaches << Breach.find(breach["id"])
    # #     end
    # # end 
    
    # def show 
    #     user = User.find(params[:id])
    #     render json: user+++
    # end

    # def edit
    #     user = User.find(params[:id])
    # end

    # def destroy
    #     user = User.find(params[:id])
    #     user.destroy
    # end

    # def update
    #     user = User.find(params[:id])
    #     user.update(name: params["name"], password: params["password"])
    #     render json: user
    # end
end
