class RashodsController < ApplicationController
  before_action :set_rashod, only: [:show, :edit, :update, :destroy]

  def index
    @rashods = Rashod.all
    respond_with(@rashods)
  end

  def show
    respond_with(@rashod)
  end

  def new
    @rashod = Rashod.new
    respond_with(@rashod)
  end

  def edit
  end

  def create
    @rashod = Rashod.new(rashod_params)
    @rashod.save
    respond_with(@rashod)
  end

  def update
    @rashod.update(rashod_params)
    respond_with(@rashod)
  end

  def destroy
    @rashod.destroy
    respond_with(@rashod)
  end

  private
    def set_rashod
      @rashod = Rashod.find(params[:id])
    end

    def rashod_params
      params.require(:rashod).permit(:schet_id, :cat_rashod_id, :comment, :rab_id, :todate, :cash)
    end
end
