class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @new_book = Book.new
    @books = @user.books
  end

  def index
    @users = User.all
    @book = Book.new
  end


  def edit
    @user = User.find(params[:id])
    if @user!= current_user
      redirect_to user_path(current_user)
    end
  end

  def follower
    @user = User.find(params[:id])
    @users = @user.following_user
  end

  def followed
    @user = User.find(params[:id])
    @users = @user.follower_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end



end
