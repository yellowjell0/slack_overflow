class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(user_params)
  end

  def create
    @user = User.new(user_params)

    if user.save
      flash[:notice] = "Welcome to slack overflow"
    else
      render 'new'
    end
  end

  def update
    @user = User.update(user_params)

    if user.save
      flash[:notice] = "Welcome to slack overflow"
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(user_params)

    if @user.destroy
      flash[:notice] = "We're sorry you decided to leave us. Come back anytime."
      redirect_to questions_path
    else
      flash[:error] = "There was a problem deleting your account"
      redirect_to questions_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :description, :password, :email)
  end
end
