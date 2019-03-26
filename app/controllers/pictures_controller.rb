class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
    @pictureuser = @picture.user.name
    @response = Cloudinary::Uploader.upload("#{@picture.attachment}",
      :categorization => "aws_rek_tagging",
      :auto_tagging => 0.9)
    @tags = @response["tags"]
  end

  def new
    @picture = Picture.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.new
    @picture.user = User.first
    @picture.update(picture_params)
    redirect_to picture_path(@picture)
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user = User.first
      if @picture.save
         redirect_to picture_path(@picture)
      else
         redirect_to new_picture_path
      end
  end

  def destroy
     @picture = Picture.find(params[:id])
     @picture.destroy
     redirect_to pictures_path
  end

private
  def picture_params
    params.require(:picture).permit(:name, :attachment, :user_id)
  end

end
