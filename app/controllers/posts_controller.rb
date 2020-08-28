class PostsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    before_action :user_is_authenticated

    def show
        set_post!
    end

    def new
        @post = Post.new
        ip_location
    end

    def edit
        set_post!
    end

    def index
        @posts = Post.all
    end

    def create
        #takes current user and instantiates new post (this associates our posts to users)
        @post = current_user.posts.build(post_params)
        puts @post.inspect
        if @post.save
            redirect_to '/posts/index'
        else
            render '/posts/new', notice: "Couldn't post. Try again!"
        end
    end

    def update
        set_post!
        @post = Post.update(post_params)
        if @post.valid?
            @post.save
            redirect_to '/posts/index'
        else 
            render '/posts/new'
        end
    end

    def destroy 
        Post.find(params[:id].destroy)
        redirect_to 'welcome'
    end

    private

    def set_post!
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(
            :content,
            :user_id,
            :post_id,
            :location_id 
            )
    end

    private

    def ip_location 
        db = MaxMindDB.new('./GeoLite2-City.mmdb')
        @ret = db.lookup('103.79.254.7')
        # While in localhost this wont won't work. So change request.remote_ip with your actual IP address to test.
     end

end