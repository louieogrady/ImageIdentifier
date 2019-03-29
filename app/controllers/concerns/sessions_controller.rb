class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to current_user
    end
  end

  def create
    user = User.find_by(name: params[:name])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        flash[:errors] = ["invalid username or password"]
        redirect_to login_path
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
