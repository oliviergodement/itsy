class PicturesController < ApplicationController
  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.save
  end

  def edit
  end

  def update
  end

  def show
    @picture = Picture.new(picture_params)
  end

  def index
    @pictures = Picture.all
  end

  def destroy
  end

private

  def picture_params
    params.require(:picture).permit(:id, :alt, :picture_url, :s3picture)
  end
end
