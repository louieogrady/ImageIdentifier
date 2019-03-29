class PicturesController < ApplicationController
    before_action :require_login, only: [:show, :index, :new, :create, :edit, :destroy]

  def index
    @user = User.find_by(params[:id])
    @pictures = Picture.all
  end

  def show
    @comment = Comment.new
    @picture = Picture.find(params[:id])
     # @response = Cloudinary::Uploader.upload("#{@picture.attachment}",
     #   :categorization => "google_tagging",
     #   :auto_tagging => 0.75)
     # @tags = @response["tags"]

     # @facialresponse = Cloudinary::Uploader.upload("#{Picture.last.attachment}", :detection => "adv_face")["info"]["detection"]["adv_face"]["data"].first["attributes"]["emotion"]["anger"]
     #  @facialhash = @facialresponse["info"]["detection"]["adv_face"]["data"].first["attributes"]
     #  @facialhash["age"] = @age.to.i
     #  @facialhash["emotion"] = @emotions
     #  @emotions["anger"] = @anger
     #  @emotions["contempt"] = @contempt
     #  @emotions["disgust"] = @disgust
     #  @emotions["fear"] = @fear
     #  @emotions["happiness"] = @happiness
     #  @emotions["neutral"] = @neutral
     #  @emotions["sadness"] = @sadness
     #  @emotions["surprise"] = @surprise

  end

  def new
    @user = User.find_by_id(params[:user_id])
    @picture = Picture.new
  end

  def edit
    @picture = Picture.find_by_id(params[:id])
  end

  def update
    @picture = Picture.find_by_id(params[:id])
    @picture.update(edit_picture_params)

    redirect_to user_picture_path(@picture) 
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
