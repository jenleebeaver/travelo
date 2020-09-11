
class FacebooksessionsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create, :auth]

  def new
    @user = User.new
    render 'posts/new'
  end

  def create
    rand_password=('0'..'z').to_a.shuffle.first(8).join
    rand_username=('0'..'z').to_a.shuffle.first(8).join
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.full_name = auth['info']['name']
      u.email = auth['info']['email']
      # u.image = auth['info']['image']
      u.password = rand_password
      u.username = rand_username
    end
    session[:user_id] = @user.id
    render 'posts/new'
   end
   
    private
   
    def auth
      request.env['omniauth.auth']
    end
  end