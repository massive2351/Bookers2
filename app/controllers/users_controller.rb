class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def new
  end

  def create
  end

  def index
    @user = current_user
    # @user_id = User.find(params[@user])
    @users = User.all
    @booknew = Book.new
  end

  def show
    @user = User.find(params[:id])
    @booknew = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user), notice: "You have updated user info successfully."
   else
     render :edit
   end
  end

  def destroy
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
