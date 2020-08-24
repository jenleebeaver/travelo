class LocationsController < ApplicationController
    def create
        Location.create(location_params)
        redirect_to user_path(location.user)
    end

    private 

    def location_params
        params.require(:location).permit(
            :location;
            :user_id,
            :post_id
        )
    end
end