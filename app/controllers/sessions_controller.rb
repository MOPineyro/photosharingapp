class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in.'
      redirect_to users_path
    else
      flash[:alert] = 'Email or password invalid.'
      render 'new'
    end
  end
end
