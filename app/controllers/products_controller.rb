class ProductsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  respond_to :js, :html

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    authorize @product
    @categories = Category.all.map {|category| [category.name, category.id]}
  end

  def create
    product = Product.new(set_params)
    authorize @product
    @product.save
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
    @product = Product.find(params[:id])
    authorize @product
    flash[:info] = "you have deleted #{@product.name}"
    @product.destroy
    redirect_to categories_path
  end

  private

  def set_params
    params.require(:product).permit(:name, :category_id, :description, :localization, :quantity, :price, :user_id)
  end

  def picture_params
    authorize @product
    params.require(:product).permit(:s3picture)
  end

end
