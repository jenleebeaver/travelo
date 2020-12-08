class LocationsController < ApplicationController

    def index
        @locations = Location.all.includes(:users, :posts).order(:location_name)
    end

    def show
        set_location!
        @locations = Location.all.includes(:users, :posts)
        @posts = Post.all.where(location_id: params[:id])
    end

    def new
        @location = Location.new
    end

    def create
        @location = Location.new(location_params)
        # Location.create(location_params)
        if @location.save
            redirect_to 'locations/index'
        else
            redirect_to new_user_post_path(@user), alert: "Your location did not save."
        end
    end

    def edit 
        set_location!
    end

    def update 
        set_location!
        @location.update(location_params)
        if @location.save
            redirect_to 'locations/index'
        else
            render :edit
        end
    end

    def destroy 
        set_location!
        @location.destroy
        flash[:notice] = "Location deleted."
        redirect_to new_user_post_path
    end

    private 

    def set_post!
        @post = Post.find_by(id: params[:post_id])
    end

    def set_location!    
        @location = Location.find_by(id: params[:id])
    end

    def location_params
        params.require(:location).permit(
            :location_name,
            :post_id
        )
    end
end