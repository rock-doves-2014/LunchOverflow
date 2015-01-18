class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.hash_tree(limit_depth: 5)
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

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to posts_path
  end

  def downvote
   @post = Post.find(params[:id])
   @post.downvote_by current_user
   redirect_to posts_path
  end

  def tagged
    if params[:tag].present?
      @posts = Post.tagged_with(params[:tag])
      @tag = params[:tag] 
      render 'index'
    else
      render text: 'no post with this tag'
    end
  end
  private

  def post_params
    params.require(:post).permit(:title, :content, :address, :user_id, :tag_list)
  end

end
