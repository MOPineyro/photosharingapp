class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_params)

    if @user.save
      flash[:notice] = 'User created.'
      redirect_to user_path(@user.id)
    else
      flash[:alert] = 'User not created.'
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(secure_params)
      flash[:notice] = 'User updated.'
      redirect_to user_path(@user.id)
    else
      flash[:alert] = 'User not updated.'
      render user_path(@user.id)
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:notice] = 'User deleted.'
      redirect_to users_path
    else
      flash[:alert] = 'User not deleted.'
      redirect_to user_path(@user.id)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def secure_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
