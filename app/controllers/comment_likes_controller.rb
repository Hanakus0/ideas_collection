class CommentLikesController < ApplicationController
  # ブックマーク処理
  def create
    @comment = Comment.find(params[:comment_id])
    @post = @comment.post
    current_user.liked_comments << @comment
    redirect_to post_path(@post), success: t('.success')
  end

  # ブックマーク解除処理
  def destroy
    # raise
    @post = Post.find_by(post_uid: params[:id])
    @comment = Comment.find(params[:comment_id])
    current_user.liked_comments.destroy(@comment)
    redirect_to post_path(@post), success: t('.success'), status: :see_other
  end
end
