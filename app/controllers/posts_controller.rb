class PostsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    before_action :user_is_authenticated

    def index
        @posts = current_user.posts
    end

    # def show
    #     # set_post
    #     @posts = current_user.posts
    #     # @posts = Post.all
    # end

    def new
        @post = Post.new
        ip_location
        # location= @post.location.build
    end

    def create
        Post.create(post_params)
        #takes current user and instantiates new post (this associates our posts to users)
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to '/posts'
        else
            render new_user_post_path(@user), notice: "Couldn't post. Try again!"
        end
    end

    def edit
        set_post
    end

    def update
        # byebug
        set_post
        if post = @post.update(post_params)
            redirect_to '/posts'
        else 
            redirect_to new_user_post_path
        end
    end

    def destroy 
        Post.find(params[:id]).destroy
        flash[:notice] = "Your post has been deleted."
        redirect_to '/posts/edit'
    end

    private

    def set_post
        @post = Post.find_by(:id => params[:id])
    end

    def post_params
        params.require(:post).permit(
            :location_name,
            :content,
            :user_id,
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