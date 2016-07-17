class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  #ta metoda to akcja formularza gdy wygenerowane sa domyslne sciezki i uzyte form_for
  def create
    #PRZYKLADOWA zawartość params
    #Parameters: {"utf8"=>"✓", "authenticity_token"=>"3mZMeLCMruSqWHuEJuVZB5kFQogWAxoSA3ueohyGWA4t3wQcWdDZSo+lYCv9jLtH+TzBYyOA1R7CBgSUB7Qh6A==", "article"=>{"title"=>"test123", "description"=>"asdasdasdasd"}, "commit"=>"Utwórz"}
    #{"utf8"=>"✓", "authenticity_token"=>"3mZMeLCMruSqWHuEJuVZB5kFQogWAxoSA3ueohyGWA4t3wQcWdDZSo+lYCv9jLtH+TzBYyOA1R7CBgSUB7Qh6A==", "article"=>{"title"=>"test123", "description"=>"asdasdasdasd"}, "commit"=>"Utwórz", "controller"=>"articles", "action"=>"create"}
    #p params
    #render plain: params[:article]

    @article = Article.new(article_parased)
    if @article.save
      flash[:notice] = "Utworzono z powodzeniem"
      redirect_to article_path(@article)
    else
      # flash[:error] = @article.errors.as_json
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    render :show
  rescue
    # render json: {message: "no record"}
    not_found
  end

  def index
    @articles = Article.all
    render :index
  end

  private

  def article_parased
    output = params.require(:article).permit(:title, :description)
    p "PROCESSING ====>"
    p output
    output
  end

end
