class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
    p "Params:"
    p params
    p "DDDDDDDDDDDDDDDDDDDDD"
    p "DDDDDDDDDDDDDDDDDDDDD"
    p "DDDDDDDDDDDDDDDDDDDDD"
    p "DDDDDDDDDDDDDDDDDDDDD"
    p "DDDDDDDDDDDDDDDDDDDDD"
    p @comment
  end

  def create
    params[:comment][:user_id] = session[:user_id]
    post = Post.find(params[:post_id])
    params[:comment][:post_id] = post.id
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))

            p parent
            p '-----'
            p params
            p 'DDDDDDD'
            p comment_params
      @comment = parent.children.build(comment_params)
      p 'FFFFFFF'
      p @comment
    else
      @comment = Comment.new(comment_params)
    end

    if @comment.save
      flash[:success] = 'Your comment was successfully added!'
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

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

end