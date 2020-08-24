class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    #find by id 
    def show
        set_user!
    end

    def index
        @users = User.all
    end

    #GET
    def new
        @user = User.new
        if session[:current_user_id]
            redirect_to "/posts/new", notice: "Already logged in!"   
        end
    end

    def edit
        set_user!
    end

    #POST
    def create
        @user = User.new(user_params)
        if (@user = User.create(user_params))
            session[:current_user_id] = @user.id
            @user.save
            redirect_to '/posts/new'
        else
            flash[:error] = "Not a valid input. Please check your values."
            render 'signup'
        end
    end

    def update
        @user = User.update(user_params)
        if @user.valid?
            @user.save
            redirect_to '/posts/new'
        else 
            render 'signup'
        end
    end

    def destroy 
        User.find(params[:id].destroy)
        redirect_to 'home'
    end

    private 

    def set_user!
        @user = User.find(params[:id])
        @user = current_user
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