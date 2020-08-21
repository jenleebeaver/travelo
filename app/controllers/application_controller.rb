class ApplicationController < ActionController::Base
    #controller filters
    protect_from_forgery with: :exception
    before_action :current_user, :verified_user
    helper_method :current_user

    private 

    def verified_user
        redirect_to '/' unless user_is_authenticated
    end

    def user_is_authenticated
        !!current_user
    end

    def current_user
        if session[:current_user_id]
            @current_user = User.find_by(id: session[:current_user_id])
        end
    end
end
