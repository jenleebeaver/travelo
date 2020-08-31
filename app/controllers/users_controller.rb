class UsersController < ApplicationController
    before_action :set_user!, only: [:show, :edit]
    skip_before_action :verified_user, only: [:new, :create, :destroy]

    #find by id 
    def show
        set_user!
    end

    def index
        @users = User.all
    end

    #GET or loading signup form 
    def new
        @user = User.new
        if session[:user_id]
            redirect_to "/posts/new", notice: "Already logged in!"   
        end
    end

    def edit
        set_user!
    end

    #POST signup
    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            #user login
            session[:user_id] = @user.id
            redirect_to '/posts/new'
        else
            flash[:error] = "Not a valid input. Please check your values."
            redirect_to '/signup'
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
        reset_session
        redirect_to 'home'
    end

    private 

    def set_user!
        @user = User.find_by(:id => params[:id])
        # @user = current_user
    end

    def user_params
        params.require(:user).permit(
            :full_name, 
            :email,
            :password,
            :password_confirmation,
            :password_digest,
            :username,
            :location,
            # locations_attributes: [
            #     :location_name,
            #     :post_id] 
            )
    end

end