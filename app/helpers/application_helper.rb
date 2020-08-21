module ApplicationHelper

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

    def login(user)
        #saves user.id in the session -> persists 
        session[:current_user_id] = @user.id
    end
end
