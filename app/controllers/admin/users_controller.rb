class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def new
    @user = User.new(params[:id])
  end

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      flash[:notice]="空欄で登録は出来ません。"
      redirect_to request.referer
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      flash[:notice]="空欄で保存は出来ません。"
      redirect_to request.referer
    end
  end

  private

  def user_params
    params.require(:user).permit(:department_id, :name, :employee_code, :position, :email, :password)
  end

end
