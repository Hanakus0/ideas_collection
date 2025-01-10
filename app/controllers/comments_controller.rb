class CommentsController < ApplicationController
  # deviseによるログイン済みかの判定
  before_action :authenticate_user!
  # 対象ポストの取得
  before_action :set_post

  # 投稿へのコメント追加
  def create
    # 親クラスからインスタンスを取得しレコードを保存
    set_comment
    @post_comment = @post.comments.new(set_comment)
    @post_comment.user_id = current_user.id

    if @post_comment.save
      flash[:comment_success] = t("messages.comment_success")
      redirect_to post_path(@post)
    end
  end

  private #######################################################
  # 対象の
  def set_post
    post_uid_param = params[:post_id]
    @post = Post.find_by(post_uid: post_uid_param)
  end

  def set_comment
    # params[:comment][:content]
    params.require(:comment).permit(:content)
  end
end
