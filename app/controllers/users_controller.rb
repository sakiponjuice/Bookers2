class UsersController < ApplicationController
  before_action :authenticate_user!


  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @new_book = Book.new
    @books = @user.books
  end
  
  



  def edit
    @user = User.find(params[:id])
  end

  



end
