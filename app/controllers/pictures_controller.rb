class PicturesController < ApplicationController
    before_action :require_login, only: [:new, :create, :edit, :destroy]

  def index
    @user = User.find(params[:user_id])
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
    @pictureuser = @picture.user.name
    @response = Cloudinary::Uploader.upload("#{@picture.attachment}",
      :categorization => "aws_rek_tagging",
      :auto_tagging => 0.9,
      :detection => "aws_rek_face")
    @tags = @response["tags"]
    # @facialresponse = Cloudinary::Uploader.upload("#{Picture.find_by_id(15).attachment}", :detection => "adv_face")
    # @facialhash = @facialresponse["info"]["detection"]["adv_face"]["data"].first["attributes"]
    @comment = Comment.new
  end


  def new
    @user = User.find(params[:user_id])
    @picture = Picture.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.new
    @picture.update(picture_params)
    redirect_to user_picture_path(@picture)
  end

  def create
    # raise
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
