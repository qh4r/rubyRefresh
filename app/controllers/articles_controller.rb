class ArticlesController < ApplicationController
  # before filter to to samo co before_action ale sprzed rails 4.0
  # before_filter :set_article_param, only: [:edit, :update, :show]
  before_action :set_article_param, only: [:edit, :update, :show]
  before_action :restrict_logged_in_and_owner, except: [:show, :index]

  def new
    unless is_user_logged_in?
      flash[:info] = 'Musisz być zalogowany by mieć dostęp do tej aktywności'
      redirect_to login_path
    end
    @article = Article.new
  end

  #ta metoda to akcja formularza gdy wygenerowane sa domyslne sciezki i uzyte form_for
  def create
    #PRZYKLADOWA zawartość params
    #Parameters: {"utf8"=>"✓", "authenticity_token"=>"3mZMeLCMruSqWHuEJuVZB5kFQogWAxoSA3ueohyGWA4t3wQcWdDZSo+lYCv9jLtH+TzBYyOA1R7CBgSUB7Qh6A==", "article"=>{"title"=>"test123", "description"=>"asdasdasdasd"}, "commit"=>"Utwórz"}
    #{"utf8"=>"✓", "authenticity_token"=>"3mZMeLCMruSqWHuEJuVZB5kFQogWAxoSA3ueohyGWA4t3wQcWdDZSo+lYCv9jLtH+TzBYyOA1R7CBgSUB7Qh6A==", "article"=>{"title"=>"test123", "description"=>"asdasdasdasd"}, "commit"=>"Utwórz", "controller"=>"articles", "action"=>"create"}
    #p params
    #render plain: params[:article]

    @article = Article.new(article_parsed)
    @article.user = active_user
    if @article.save
      flash[:success] = "Utworzono z powodzeniem"
      redirect_to article_path(@article)
    else
      # flash[:error] = @article.errors.as_json
      # RENDER Z SYMBOLEM ODNOSI SIE TYLKO DO WIDOKU
      # NIE WYWOLUJE METODY O TAKIEJ NAZWIE
      # WYWOLANIE METODY W TYM WYPADKU TO new lub self.new
      render :new
    end
  end

  def show
    # set_article_param
    render :show
  end

  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 5)
    render :index
  end

  def edit
    # set_article_param
  end

  def destroy
    if (@article = Article.destroy(params[:id]))
      flash[:success] = "Usunięto z powodzeniem"
    else
      flash[:success] = "Błąd podczas usuwania"
    end
    redirect_to articles_path
  end

  def update
    # set_article_param
    # chałupnicza metoda
    # article_parsed.each { |k, v| @article[k] = v }
    # if @article.save
    #   flash[:notice] = "Poprawnie zaktualizowano pozycję"
    # dobra metoda
    if @article.update article_parsed
      flash[:info] = "Poprawnie zaktualizowano pozycję"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  private
  def restrict_logged_in_and_owner
    if !is_user_logged_in?
      redirect_to articles_path
    elsif @article && !active_user_id_match?(@article.user_id)
      redirect_to articles_path
    end
  end

  def set_article_param
    @article = Article.find(params[:id])
  rescue
    # render json: {message: "no record"}
    not_found
  end

  def article_parsed
    output = params.require(:article).permit(:title, :description)
    p "PROCESSING ====>"
    p output
    output
  end

end
