class SessionController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create, :createFB, :destroy]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id]= @user.id
            redirect_to new_post_path(@user)
        else
            redirect_to '/login'
            flash[:notice] = "Couldn't find user.  Please signup."
            #render gives us the div field with errors and an extra layer of security vs redirect. Render can't be used in form_for.'
        end
    end

    def createFB
        rand_password=('0'..'z').to_a.shuffle.first(8).join
        rand_username=('0'..'z').to_a.shuffle.first(8).join
        if @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.full_name = auth['info']['name']
            u.email = auth['info']['email']
            # u.image = auth['info']['image']
            u.password = rand_password
            u.username = rand_username
            end
            session[:user_id] = @user.id
            redirect_to new_post_path(@user)
        else 
            redirect_to new_post_path(@user), notice: "Couldn't find facebook credentials. Please signup."
        end
    end

    def destroy 
        session.delete("user_id")
        reset_session
        redirect_to home_path
    end

    private 

    def auth
        request.env['omniauth.auth']
      end

end