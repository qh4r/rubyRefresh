class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(deserialize_user)
    if @user.save
      flash[:success] = 'Utworzono użytkownika'
      redirect_to root_path
    else
      render :new
    end
  end

  def deserialize_user
    @user = params.require(:user).permit(:username, :email, :password)
  end

end