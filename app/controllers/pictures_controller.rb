class PicturesController < ApplicationController
  def new
    @picture = Picture.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

private

  def picture_params
    params.require(:picture).permit(:alt, :picture_url, :picture)
  end
end
