
class FacebooksessionsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create, :auth]

    def create
      @user = User.find_or_create_by(id: auth['uid']) do |u|
        u.full_name = auth['info']['name']
        u.email = auth['info']['email']
        # u.image = auth['info']['image']
      end
      session[:user_id] = @user.id
      current_user 
      render 'posts/new'
    end
   
    private
   
    def auth
      request.env['omniauth.auth']
    end
  end