class AdminController < ApplicationController

  def index
    @category = Category.new
    @categories = Category.all

    @user = User.new
    @users = User.all
  end

end
