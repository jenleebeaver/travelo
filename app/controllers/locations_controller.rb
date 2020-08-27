class LocationsController < ApplicationController
    before_action :user_is_authenticated?

    def new
        @location = Location.new
    end

    def index
        @locations = Location.all
    end

    def create
        @location = Location.new(location_params)
        Location.create(location_params)
        redirect_to user_path(location.user)
    end

    private 

    def location_params
        params.require(:location).permit(
            :location_name,
            :post_id
        )
    end
end