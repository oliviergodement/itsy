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
  end

  def destroy
  end

private

  def picture_params
    params.require(:picture).permit(:alt, :picture_url, :s3picture)
  end
end
