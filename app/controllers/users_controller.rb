class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @userpictures = @user.pictures
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
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

  def update
    @user = User.find_by_id(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
