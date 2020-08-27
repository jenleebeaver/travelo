class SessionController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create, :destroy]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id]= @user.id
            redirect_to '/posts/new'
        else
            redirect_to 'session/new', notice: "Couldn't find user.  Please signup."
            #render gives us the div field with errors and an extra layer of security vs redirect. Render can't be used in form_for.'
        end
    end

    def destroy 
        session.delete("user_id")
        reset_session
        redirect_to 'static/home'
    end

end