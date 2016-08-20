class CategoriesController < ApplicationController
  before_action :get_category, only: [:show, :edit, :update]
  before_action :ensure_logged_in, except: [:index, :show]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(parse_category_params)
    if @category.save
      flash[:success] = 'Utworzono z powodzeniem'
      redirect_to categories_path
    else
      render new_category_path
    end
  end

  def show
    # params[:id] tez dziala require sprawdza na obecnosc
    @articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  def edit

  end

  def update
    if @category.update parse_category_params
      flash[:success] = 'Zapisano zmiany'
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  private
  def parse_category_params
    params.require(:category).permit(:name)
  end

  def ensure_logged_in
    self.active_user_is_admin? || redirect_to(login_path)
  end

  def get_category
    @category = Category.find(params.require(:id))
  end

end