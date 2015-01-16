class PostsController < ApplicationController

  def index
    @posts = Posts.all
  end

  def show
    @post = Post.find(params[:id])
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to post_path(post.id)
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :address, :user_id)
  end

end