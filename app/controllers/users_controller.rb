class UsersController < ApplicationController

    def sign_up 
        @user = User.new
        render :sign_up
    end

    def create
        @user = User.new(user_params)
        @user.save 
        
    end

    private

    def user_params
        params.require(:user).permit(:name, :last_name, :email, :password, :username)
    end
end
