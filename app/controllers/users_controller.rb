class UsersController < ApplicationController

  before_action :authenticate, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id]
    if current_user == @user
      render 'show'
    else
      redirect_to root_path
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to users_index
  end

  def add_friend
    @user = current_user.id
    @other_user = User.find params[:id]
    @user.add_friend(@other_user)

    redirect_to users_index
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :birthday, :password_digest, :password, :password_confirmation)
  end

end
