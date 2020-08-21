class ApplicationController < ActionController::Base
    include ApplicationHelper
    #controller filters
    protect_from_forgery with: :exception
    before_action :current_user, :verified_user
    helper_method :current_user

end
