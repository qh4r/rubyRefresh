class UsersController < ApplicationController
  before_action :find_user_by_id, only: [:show, :edit, :update, :destroy]

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

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

  def edit
  end

  def update
    if @user.update deserialize_user
      flash[:success] = 'Zaktualizowano dane użytkownika!'
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = 'Usunięto użytkownika'
    else
      flash[:info] = 'Wystąpił błąd, niepowodzenie'
    end
    redirect_to root_path
  end

  def deserialize_user
    @user = params.require(:user).permit(:username, :email, :password)
  end

  def find_user_by_id
    @user = User.find(params[:id])
  rescue
    not_found
  end
end