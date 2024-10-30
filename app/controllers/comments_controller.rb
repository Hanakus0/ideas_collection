class CommentsController < ApplicationController
  before_action :set_post

  def create
    # 親クラスからインスタンスを取得しレコードを保存
    # @post = get_post_genre.posts.build(post_params)
    # set_comment
    @post_comment = @post.comments.new(set_comment)
    @post_comment.user_id = current_user.id

    if @post_comment.save
      redirect_to post_path(@post), notice: "Cooment was successfully created."
    else
      redirect_to  post_path(@post), status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render turbo_stream: turbo_stream.remove(@comment)
  end

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
