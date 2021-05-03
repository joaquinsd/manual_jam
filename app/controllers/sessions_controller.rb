class SessionsController < ApplicationController
  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Signed out succesfully'
  end

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in succesfully'
    else
      flash.now[:notice] = 'Invalid email or password'
      render action: :new
    end
  end
end
