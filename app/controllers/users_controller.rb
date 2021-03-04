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

    def follow
        @user = User.find(params[:id])
        current_user.followings << @user
        redirect_back(fallback_location: users_path(@user))
      end
      
      def unfollow
        
        
        @user = User.find(params[:id])
        current_user.given_follows.find_by(followed_user_id: @user.id)&.destroy
        redirect_back(fallback_location: users_path(@user))
      end


    def show
        @current_user = current_user
        @profile_user = User.find_by(id: params[:id])
        @post_list = Post.where(user_id: params[:id])
        render :show
    end
    


    private

    def user_params
        params.require(:user).permit(:name, :last_name, :email, :password, :username)
    end


end
