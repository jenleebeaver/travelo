module ApplicationHelper


    def verified_user
        redirect_to '/' unless user_is_authenticated
    end

    #like logged_in?
    def user_is_authenticated
        !!current_user
        #like a ternary or if/else statement
        #ie. current_user ? true : false
        #if current_user true else false 
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
            #first time will populate @current_user
            #||= is considered to be a memoization technique (optimization on current execution frame) so the current_user method calls on the db one time
        end
    end

    def login(user)
        #saves user.id in the session -> persists 
        session[:user_id] = @user.id
    end
end
