class CommentsControlller < ApplicationsController
    before_action :user_is_authenticated?
    
    def new
    end

    def create
        Comment.create(comment_params)
        redirect_to user_path(comment.user)
    end

    private 

    def location_params
        params.require(:comment).permit(
            :comment,
        )
    end
end