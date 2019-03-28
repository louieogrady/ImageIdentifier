class PicturesController < ApplicationController
    before_action :require_login, only: [:show, :index, :new, :create, :edit, :destroy]

  def index
    @user = User.find_by(params[:id])
    @pictures = Picture.all
  end

  def show
    @comment = Comment.new
    @picture = Picture.find(params[:id])
    @user = @picture.user
    # @response = Cloudinary::Uploader.upload("#{@picture.attachment}",
    #   :categorization => "imagga_tagging",
    #   :auto_tagging => 0.3)
    # @tags = @response["tags"]
  end

  def new
    @user = User.find_by(params[:id])
    @picture = Picture.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.new
    @picture.update(picture_params)
    redirect_to user_picture_path(@userpicture) # NEEDS TO CHANGE?? - no @userpicture = poss change to @picture.user
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

  def require_login
    authorized?
  end

end
