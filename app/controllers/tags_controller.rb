class TagsController < ApplicationController
  # tagifyのオートコンプリート機能用処理
  def search
    q = params[:value]
    @tags = Tag.where("name LIKE ?", "%#{ q }%")
    # 値を取得する
    @tags_name = @tags.pluck(:name)
    render json: @tags_name
  end
end
