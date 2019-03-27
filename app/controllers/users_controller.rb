class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @userpictures = @user.pictures
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:errors] = ['something went wrong, try again']
        redirect_to signup_path
      end
  end

private
  def user_params
    params.require(:user).permit(:name, :password)
  end

end
