class PostsController < ApplicationController
    def index
        return redirect_to login_path unless is_signed_in?
        @post_list = Post.where(user_id: current_user.id)
        render :index
        # is_signed_in? ? render :index : redirect_to login_path
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.save
        redirect_to index_path 
    end
    

    private

    def post_params
        params.require(:post).permit(:text)
    end

end
