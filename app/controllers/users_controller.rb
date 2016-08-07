class UsersController < ApplicationController
  before_action :find_user_by_id, only: [:show, :edit, :update, :destroy]
  before_action :restrict_logged_in, except: [:new, :create]
  before_action :restrict_not_logged_in, only: [:new, :create]
  before_action :restrict_self, only: [:edit, :destroy]

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
      session[:user_id] = @user.id
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

  private
  def deserialize_user
    params.require(:user).permit(:username, :email, :password)
  end

  def find_user_by_id
    @user = User.find(params[:id])
  rescue
    not_found
  end

  def restrict_self
    redirect_to users_path unless active_user_id_match?(@user.id)
  end

  def restrict_logged_in
    redirect_to login_path unless is_user_logged_in?
  end

  def restrict_not_logged_in
    redirect_to users_path if is_user_logged_in?
  end

end