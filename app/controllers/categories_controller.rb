class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(set_params)
    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    Category.update(params[:id], set_params)
    redirect_to categories_path
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
  end

  def destroy
    Category.find(params[:id]).destroy
  end

  private

  def set_params
    params.require(:category).permit(:name)
  end
end
