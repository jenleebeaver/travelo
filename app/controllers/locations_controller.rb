class LocationsController < ApplicationController
    before_action :user_is_authenticated?

    def index
        if params[:post_id]
            set_post!
            if @post.nil?
                redirect_to posts_path, alert: "Post not found."
            else
                @locations = @post.locations
            end
        else
        @locations = Location.all.includes(:users, :posts, :comments)
        end
    end

    def show
        if params[:post_id]
            set_post!
            @location = @post.locations.find_by(id: params[:id])
            if @location.nil?
                redirect_to post_locations_path(@post), alert: "Location not found."
            end
        else
        @location = Location.find_by(id: params[:id])
        end
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
            redirect_to 'posts/new', alert: "Your location did not save."
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
        redirect_to 'posts/new'
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