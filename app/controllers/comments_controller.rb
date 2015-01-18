class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    if session[:user_id]
      @comment = Comment.new(parent_id: params[:parent_id])
    else
      redirect_to login_path
    end
  end

  def create
    params[:comment][:user_id] = session[:user_id]
    post = Post.find(params[:post_id])
    params[:comment][:post_id] = post.id
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
    else
      @comment = Comment.new(comment_params)
    end

    if @comment.save
      redirect_to post
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(comments_params)
      redirect_to comment_path(comment.id)
    else
      render 'edit'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to root_path
  end

  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote_by current_user
    redirect_to post_path(@comment.post)
  end

  def downvote
   @comment = Comment.find(params[:id])
   @comment.downvote_by current_user
   redirect_to post_path(@comment.post)
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

end
