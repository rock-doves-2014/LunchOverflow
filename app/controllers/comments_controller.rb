class CommentsController < ApplicationController

  def index
    @comments = current_user.comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    if session[:user_id]
      @comment = Comment.new(params[:comment])
    else
      redirect_to login_path
    end
  end

  def create
    # This method needs some love...
    #
    # Here are some options: can we move this logic into a model somewhere.
    # Like:
    #
    # Comment.create_for_post(some_parent)
    #
    params[:comment][:user_id] = session[:user_id] #changing the inputs is a smell to me...
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
    if session[:user_id]
      @comment = Comment.find(params[:id])
    else
      redirect_to login_path
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(comment_params)
      redirect_to Post.find(comment.post_id)
    else
      render 'edit'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to post_path(comment.post)
  end

  def upvote
    if session[:user_id]
      @comment = Comment.find(params[:id])
      @comment.upvote_by current_user
      redirect_to post_path(@comment.post)
    else
      redirect_to login_path
    end
  end

  def downvote
    if session[:user_id]
      @comment = Comment.find(params[:id])
      @comment.downvote_by current_user
      redirect_to post_path(@comment.post)
    else
      redirect_to login_path
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

end
