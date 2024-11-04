class PostLikesController < ApplicationController
  # ブックマーク処理
  def create
    @post = Post.find_by(post_uid: params[:post_uid])
    current_user.like_posts << @post
    redirect_to post_path(@post), success: t('.success')
  end

  # ブックマーク解除処理
  def destroy
    target_post = Post.find_by(post_uid: params[:id])
    @post = current_user.post_likes.find_by(post_id: target_post.id).post
    current_user.like_posts.destroy(@post)
    redirect_to post_path(@post), success: t('.success'), status: :see_other
  end
end
