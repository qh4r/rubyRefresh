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

    @article = Article.new(article_parsed)
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

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    if (@article = Article.destroy(params[:id]))
      flash[:notice] = "Usunięto z powodzeniem"
    else
      flash[:notice] = "Błąd podczas usuwania"
    end
    redirect_to articles_path
  end

  def update
    @article = Article.find(params[:id])
    # chałupnicza metoda
    # article_parsed.each { |k, v| @article[k] = v }
    # if @article.save
    #   flash[:notice] = "Poprawnie zaktualizowano pozycję"
    # dobra metoda
    if @article.update article_parsed
      flash[:notice] = "Poprawnie zaktualizowano pozycję"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  private

  def article_parsed
    output = params.require(:article).permit(:title, :description)
    p "PROCESSING ====>"
    p output
    output
  end

end
