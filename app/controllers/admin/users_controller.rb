class Admin::UsersController < ApplicationController
  skip_before_action :login_required
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(session[:user_id])
  end
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(session[:user_id])
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to root_path, notice: "アカウントを登録しました。"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: "アカウントを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_user_url, notice: "アカウントを削除しました。"
  end
  
  def profile
    @user = User.find(session[:user_id])
  end
  
  def profile_update
    @user = User.find(session[:user_id])
    @user.update!(params.permit(:name, :icon, :introduction))
    redirect_to users_profile_path, notice: "プロフィールを更新しました。"
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon, :introduction)
  end

end
