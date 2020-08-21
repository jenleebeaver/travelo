class PostsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]


    def show
        set_post!
    end

    def new
        @post = Post.new
    end

    def edit
        set_post!
    end

    def index
        @posts = User.all
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect post_path(@post)
        else
            render '/posts/new', notice: "Couldn't post. Try again!"
        end
    end

    def update
        @post = Post.update(post_params)
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
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
        params.require(:post).permit(:content)
    end

end