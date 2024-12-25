class PostLikesController < ApplicationController
  # deviseによるログイン済みかの判定
  before_action :authenticate_user!

  # ブックマーク処理
  def create
    @post = Post.find_by(post_uid: params[:id])
    current_user.like_posts << @post
  end

  # ブックマーク解除処理
  def destroy
    target_post = Post.find_by(post_uid: params[:id])
    @post = current_user.post_likes.find_by(post_id: target_post.id).post
    current_user.like_posts.destroy(@post)
  end
end
