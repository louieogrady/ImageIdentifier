class PicturesController < ApplicationController
    before_action :require_login, only: [:show, :index, :new, :create, :edit, :destroy]

  def index
    @user = User.find_by(params[:id])
    @pictures = Picture.all
  end

  def show
    @comment = Comment.new
    @picture = Picture.find(params[:id])
    #@user = @picture.user
     @response = Cloudinary::Uploader.upload("#{@picture.attachment}")
     #   :categorization => "google_tagging",
     #   :auto_tagging => 0.75,
     #   :detection => "aws_rek_face",
     #   :auto_tagging => 0.8)
     # @tags = @response["tags"]
  end

  def new
    @user = User.find_by_id(params[:user_id]) # had to specify user_id specifically here, error when given params[:id])
    @picture = Picture.new
  end

  def edit
    # byebug
    @picture = Picture.find_by_id(params[:id])
  end

  def update
    # byebug
    @picture = Picture.find_by_id(params[:id])
    @picture.update(edit_picture_params)

    redirect_to user_picture_path(@picture) # NEEDS TO CHANGE?? - no @userpicture = poss change to @picture.user
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
      if @picture.valid?
        @picture.save
         redirect_to user_picture_path(@picture.user, @picture)
      else
         redirect_to new_user_picture_path
      end
  end

  def destroy
     @picture = Picture.find(params[:id])
     @picture.destroy
     redirect_to user_pictures_path
  end

private
  def picture_params
    params.require(:picture).permit(:name, :attachment, :user_id)
  end

  def edit_picture_params
    params.permit(:name, :attachment)
  end

  def require_login
    authorized?
  end

end
