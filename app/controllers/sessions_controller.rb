class SessionsController < ApplicationController

    
    def new        
        return redirect_to index_path if is_signed_in?
        render :login    
    end


    def create
        @user = User.find_by(email: params[:login][:email])
        if @user&.authenticate(params[:login][:password])
            @user.change_token
            self.save_session(@user)
            @current_user = @user
            redirect_to index_path  
        else
            render :login
        end          
    end

    def destroy
        cookies[:session_token] = nil
        cookies[:session_id] = nil
        render :login 
    end
  
    private 
    
    def save_session(user)
        cookies[:session_token] = user.token
        cookies[:session_id] = user.id
    end

  
end
