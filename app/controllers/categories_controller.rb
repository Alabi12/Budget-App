class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @expenditures = @category.expenditures
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
