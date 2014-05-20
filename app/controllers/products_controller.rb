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
    @product = Product.create(set_params)
    @product.pictures.create(picture_params)
    redirect_to product_path(@product)
  end

  def edit
    @categories = Category.all.map {|category| [category.name, category.id]}
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(set_params)
    @product.pictures.create(picture_params)

    respond_with do |format|
      format.js
      format.html { redirect_to product_path(@product) }
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    Product.find(params[:id]).destroy
  end

  private

  def set_params
    params.require(:product).permit(:name, :category_id, :description, :localization, :quantity, :price)
  end

  def picture_params
    params.require(:product).permit(:s3picture)
  end

end
