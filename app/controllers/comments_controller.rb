class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
    @usercomments = User.first.pictures.all.map {|x| x.comments.all.map {|y| y.content}}
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
    @picture = Picture.find(params[:id])
  end

  def create
    session[:return_to] = request.referer
    @comment = Comment.new
    #byebug
    #@comment.picture = Picture.first
    @comment.update(comment_params)
    redirect_to session[:return_to]
  end

  def update
    @comment = Comment.new
    #@comment.picture = Picture.first
    @comment.update(comment_params)
    #byebug
    redirect_to user_picture_path(@comment.picture_id)
    #redirect_to user_picture_path(@comment.picture.user_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end

private
  def comment_params
    params.require(:comment).permit(:content, :picture_id, :user_id)
  end
end
