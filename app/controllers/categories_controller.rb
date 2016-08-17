class CategoriesController < ApplicationController

  def index
    @categories = Category.all
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

  end

  private
  def parse_category_params
    params.require(:category).permit(:name)
  end

end