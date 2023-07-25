class CommentController < ApplicationController
  def create
    @post = Post.find(params.fetch[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

    private

  def comment_params
    params.fetch(:comment).permit('content')
  end
end

