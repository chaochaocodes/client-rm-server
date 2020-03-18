class UsersController < ApplicationController    
        def login
        user = User.find_or_create_by(name: params["name"], password: params["password"])
        render json: user
    end

    # def save_search
    #     email = Email.find_or_create_by(address: params["address"], user_id: params["id"])
    #     user = User.find(params["id"])
    #     user.emails << email
    #     params["breaches"].map do |breach|
    #         email.breaches << Breach.find(breach["id"])
    #     end
    # end 
    
    def show 
        user = User.find(params[:id])
        render json: user+++
    end

    def edit
        user = User.find(params[:id])
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
    end

    def update
        user = User.find(params[:id])
        user.update(name: params["name"], password: params["password"])
        render json: user
    end
end
