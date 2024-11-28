class CommentsController < ApplicationController
  # deviseによるログイン済みかの判定
  before_action :authenticate_user!
  # 対象ポストの取得
  before_action :set_post

  def create
    # 親クラスからインスタンスを取得しレコードを保存
    set_comment
    @post_comment = @post.comments.new(set_comment)
    @post_comment.user_id = current_user.id

    @post_comment.save
    
    flash.now[:success] = t('messages.comment_success')
    redirect_to post_path(@post)
  end

  # コメントの削除(未定)
  # def destroy
  #   @comment = Comment.find(params[:id])
  #   @comment.destroy
  #   redirect_to post_path(@post.post_uid), notice: "Cooment was successfully created."
  # end

  private #######################################################

  def set_post
    post_uid_param = params[:post_id]
    @post = Post.find_by(post_uid: post_uid_param)
  end

  def set_comment
    # params[:comment][:content]
    params.require(:comment).permit(:content)
  end

end
