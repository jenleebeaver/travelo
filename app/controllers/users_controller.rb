class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    #find by id 
    def show
        set_user!
    end

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def edit
        set_user!
    end

    def create
        @user = User.new 
        if (@user = User.create(user_params))
            session[:user_id] = @user.id
            @user.save
            redirect_to '/users'
        else
            flash[:error] = "Not a valid input. Please check your values."
            render 'signup'
        end
    end

    # def update
    #     @user = User.update(user_params)
    #     if @user.valid?
    #         @user.save
    #         redirect_to 'welcome'
    #     else 
    #         render 'signup'
    #     end
    # end

    def destroy 
        User.find(params[:id].destroy)
        redirect_to 'home'
    end

    private 

    def set_user!
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(
            :name, 
            :email,
            :password,
            :password_confirmation,
            :password_digest,
            :username,
            :location,
            :uid,
            :image
            )
    end

end