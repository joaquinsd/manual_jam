class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @stories = Story.where(user_id: @user.id)
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def new
    @user = User.new
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
