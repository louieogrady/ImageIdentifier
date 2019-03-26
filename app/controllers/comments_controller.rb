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
  end

  def create
    @comment = Comment.new
    @comment.picture = Picture.first
    @comment.update(comment_params)
    redirect_to pictures_path
  end

  def update
    @comment = Comment.new
    @comment.picture = Picture.first
    @comment.update(comment_params)
    redirect_to pictures_path
  end

  def delete
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end

private
  def comment_params
    params.require(:comment).permit(:content, :picture_id, :user_id)
  end
end
