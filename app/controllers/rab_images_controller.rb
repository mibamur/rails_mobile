class RabImagesController < ApplicationController
  before_action :set_rab_image, only: [:show, :edit, :update, :destroy]

  def index
    @rab_images = RabImage.all
    respond_with(@rab_images)
  end

  def show
    respond_with(@rab_image)
  end

  def new
    @rab_image = RabImage.new
    respond_with(@rab_image)
  end

  def edit
  end

  def create
    @rab_image = RabImage.new(rab_image_params)
    @rab_image.save
    respond_with(@rab_image)
  end

  def update
    @rab_image.update(rab_image_params)
    respond_with(@rab_image)
  end

  def destroy
    @rab_image.destroy
    respond_with(@rab_image)
  end

  private
    def set_rab_image
      @rab_image = RabImage.find(params[:id])
    end

    def rab_image_params
      params.require(:rab_image).permit(:image, :rab_id)
    end
end
