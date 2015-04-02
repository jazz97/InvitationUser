class UsersController < ApplicationController
  before_filter :authenticate_role
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id]) 
  end
  def new
    @user =User.new
  end
  def destroy
    @user = User.find(params[:id])
    User.destroy
  end
  
  def authenticate_role
    unless current_user.admin 
      redirect_to root_path
    end
  end
end
