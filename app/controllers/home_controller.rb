class HomeController < ApplicationController
  def index
    if user_signed_in?
      @posts = Post.order("RANDOM()").limit(20)
    else
      @posts = Post.order("RANDOM()").limit(20)
    end
  end
end
