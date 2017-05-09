class SessionsController < ApplicationController
  def create

    user = User.find_by(user_name: params[:session][:user_name])
    if user and user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to '/', notice: "Log in successful."
    else
      flash.now[:alert] = "Login Unsucessful"
      render 'new'
    end
  end

  def destroy
    sessions[:user_id] = nil
    redirect_to questions_path, message: 'Logged Out'
  end

  def new
    @user = User.new
  end
end

