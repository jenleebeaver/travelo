class SessionController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(:email => params[:email])
        if @user 
            login(@user)
            redirect_to '/posts/new'
        else
            redirect_to '/signup', notice: "Couldn't find user.  Please signup."
        end
    end

    def destroy 
        session.delete("user_id")
        reset_session
        redirect_to root_path
    end

end