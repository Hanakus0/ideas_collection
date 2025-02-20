class BookmarksController < ApplicationController
  # ブックマーク処理
  def create
    @post = Post.find_by(post_uid: params[:id])
    current_user.bookmark_posts << @post
    # redirect_to post_path(@post), success: t('.success')
  end

  # ブックマーク解除処理
  def destroy
    target_post = Post.find_by(post_uid: params[:id])
    @post = current_user.bookmarks.find_by(post_id: target_post.id).post
    current_user.bookmark_posts.destroy(@post)
    # redirect_to post_path(@post), success: t('.success'), status: :see_other
  end
end
