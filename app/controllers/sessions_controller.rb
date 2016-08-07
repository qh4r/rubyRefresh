class SessionsController < ApplicationController

  before_action :logged_in_redirect, only: [:new, :create]

  def new
    # debugger
    @error_msg = String.new
  end

  def create
    # debugger zatrzymuje server w tym miejscu jak breakpoint i pozwala na dostep do
    # zmiennych srodowiskowych w konsoli serwera - ctrl + d pozwala kontynuowac prace

    # debugger

    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Zalogowano jako #{user.username}"
      redirect_to user_path(user)
    else
      # mozna by uzyc flash.now[:cos] = 'coc tam...'
      # flash pozostaje przez 1 redirect flash.now tylko do konca aktualnego
      @error_msg = 'Niepoprawna nazwa użytkownika lub hasło'
      render :new
    end
  end

  def close
    session[:user_id] = nil;
    flash[:info] = 'Wylogowano'
    redirect_to root_path
  end

  def logged_in_redirect
    redirect_to articles_path if is_user_logged_in?
  end

end