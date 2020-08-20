class SessionController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        if @user = User.find_by(:email => params[:email])
            session[:user_id] = @user.id
            redirect_to '/posts/new'
        else
            redirect_to '/signup', :message => "Couldn't find user.  Please signup.'"
        end
    end

    def destroy 
        session.delete("user_id")
        redirect_to root_path
    end

end