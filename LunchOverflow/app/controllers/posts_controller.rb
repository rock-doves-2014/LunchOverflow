class PostsController < ApplicationController

  def index
    @posts = Posts.all
  end

  def new
    @post = Post.new
  end

  def create
    user = User.find(session[:user_id])
    @post = user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :address, :user_id)
  end

end