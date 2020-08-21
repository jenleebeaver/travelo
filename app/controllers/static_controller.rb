
class StaticController < ApplicationController
    skip_before_action :verified_user, only: [:home]

    #Action/End point to HTTP request 
    def home
    end
end