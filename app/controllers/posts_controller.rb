class PostsController < ApplicationController
    def index
        return redirect_to login_path unless is_signed_in?
        render :index
        # is_signed_in? ? render :index : redirect_to login_path
    end
end
