class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.hash_tree(limit_depth: 5)
  end

  def new
    if session[:user_id]
      @post = Post.new
    else
      redirect_to login_path
    end
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
    if session[:user_id]
      @post = Post.find(params[:id])
    else
      redirect_to login_path
    end
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
    # Sometimes you can write an implementation, but not express the meaning.
    # I would much prefer to see `if current_user`.  Reason being thinking
    # about sessions and keys makes my brain hurt and I don't understand what
    # you _intention_ is.  Sometimes you take pieces of implementation and wrap
    # them in an English-friendly name so that your collaborators can
    # understand your _intention_.
    if session[:user_id]
      @post = Post.find(params[:id])
      @post.upvote_by current_user
      redirect_to posts_path
    else
      redirect_to login_path
    end
  end

  def downvote
    if session[:user_id]
      @post = Post.find(params[:id])
      @post.downvote_by current_user
      redirect_to posts_path
    else
      redirect_to login_path
    end
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
