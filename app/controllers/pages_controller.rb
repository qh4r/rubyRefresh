class PagesController < ApplicationController
  def home
    redirect_to articles_path if self.is_user_logged_in?
  end

  def about

  end
end