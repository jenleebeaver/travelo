
class StaticController < ApplicationController
    skip_before_action :verified_user, only: [:home, :about]

    #Action/End point to HTTP request 
    def home
    end

    def about 
    end

end