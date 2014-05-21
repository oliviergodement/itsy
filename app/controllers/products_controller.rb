class ProductsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  respond_to :js, :html

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all.map {|category| [category.name, category.id]}
  end

  def create
    product = Product.create(set_params)
    redirect_to edit_prout_path(product)
  end

  def edit_pictures
    @product = Product.find(params[:id])
  end

  def create_picture
    # @product = Product.find(params[:id])
    # @product.update(set_params)
    # redirect_to product_path(@product)
    @product = Product.find(params[:id])
    @product.pictures.create(picture_params)
  end

  def edit
    @categories = Category.all.map {|category| [category.name, category.id]}
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(set_params)
    redirect_to product_path(@product)
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    product = Product.find(params[:id])
    flash[:info] = "you have deleted #{product.name}"
    product.destroy
    redirect_to categories_path
  end

  private

  def set_params
    params.require(:product).permit(:name, :category_id, :description, :localization, :quantity, :price)
  end

  def picture_params
    params.require(:product).permit(:s3picture)
  end

end
