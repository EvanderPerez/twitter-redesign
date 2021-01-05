module SessionsHelper

    # attr_accessor :current_user
    # attr_writer :current_user
    # attr_reader :current_user


    def current_user
        @current_user ||= User.find_by(id: cookies[:session_id], token: cookies[:session_token])
    end

    def current_user=(user)
        @current_user = user
    end

    def is_signed_in?
        !current_user.nil?
    end
    

end
