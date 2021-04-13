class Admin::UsersController < ApplicationController
  def index
    @users = User.all
    # @user = current_user
  end

  def show
    # @user = User.find(params[:id])
    @user = User.find(session[:user_id])
  end
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
  
    if @user.save
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_user_url, notice: "ユーザー「#{@user.name}」を削除しました。"
  end
  
  def profile
    @user = User.find(session[:user_id])
  end
  
  def profile_update
    user = User.find(session[:user_id])
    user.update!(user_params)
    redirect_to users_profile_path, notice: "プロフィールを更新しました。"
  end
  
  def account
    @user = User.find(session[:user_id])
  end
  
  def account_edit
    @user = User.find(session[:user_id])
  end
  
  def account_update
    user = User.find(session[:user_id])
    user.update!(user_params)
    redirect_to users_account_path, notice: "アカウントを更新しました。"
  end

  private
  
  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :icon, :introduction)
  end

end
