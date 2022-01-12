class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create confirm]
  def new
    @user = User.new
  end


  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "サインアップできました。"
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "個人情報変更しました!"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
