class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def not_found
    # raise ActionController::RoutingError.new('Not Found')
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.xml { head :not_found }
      format.any { head :not_found }
    end
  end

  #dzieki temu metody dostepne sa w widokach uzywajacych kontroler dziedziczacy ten
  helper_method :active_user, :is_user_logged_in?, :active_user_admin_or_id_match?, :active_user_is_admin?

  def active_user
    # taki fajny skurtowiec ||= oznacza dokladnie to
    # (@active_user || @active_user = User.find(session[:user_id])) if session[:user_id]
    @active_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue
    nil
  end

  def is_user_logged_in?
    !!active_user
  end

  def require_user
    unless is_user_logged_in?
      flash[:danger] = 'Musisz być zalogowany by uzyskać dostęp'
      redirect_to root_path
    end
  end

  def active_user_admin_or_id_match?(id)
    is_user_logged_in? && (active_user.id == id || active_user.is_admin)
  end

  def active_user_is_admin?
    is_user_logged_in? && active_user.is_admin
  end

end
