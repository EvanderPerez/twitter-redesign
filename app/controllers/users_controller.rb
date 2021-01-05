class UsersController < ApplicationController


    def new 
        @user = User.new 
        if helpers.is_signed_in? 
            redirect_to index_path                 
        else
            render :sign_up                
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            self.save_session(@user)
            redirect_to index_path 
        else 
            render :sign_up
        end

    end



    private

    def user_params
        params.require(:user).permit(:name, :last_name, :email, :password, :username)
    end


end
