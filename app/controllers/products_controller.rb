class ProductsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all.map {|category| [category.name, category.id]}
  end

  def create
    @product = Product.create(set_params)
    redirect_to product_path(@product)
  end

  def edit
    @categories = Category.all.map {|category| [category.name, category.id]}
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.update(params[:id], set_params)
    redirect_to product_path(@product)
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    Product.find(params[:id]).destroy
  end

  private

  def set_params
    params.require(:product).permit(:user_id, :name, :category_id, :description, :localization, :quantity, :price)
  end

end
