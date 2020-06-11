class CommentsController < ApplicationController
  def new

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = params[:user_id]
    @comment.post_id = params[:post_id]

    # flash[:success] = @comment.user_id
    post = NewsPost.find(params[:post_id])

    if @comment.save
      flash[:success] = "Leave comment successfully !"
      redirect_to post
    else
      flash[:danger] = @comment.errors
      redirect_to post
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end


end
