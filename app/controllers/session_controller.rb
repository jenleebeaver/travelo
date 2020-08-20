class SessionController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        if @user = User.find_by(username: params[:user][:username])
            session[:user_id] = @user.id
            redirect_to 'welcome'
        else
            render '/signup'
        end
    end

    def destroy 
        session.delete("user_id")
        redirect_to root_path
    end

end