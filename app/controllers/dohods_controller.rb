class DohodsController < ApplicationController
  before_action :set_dohod, only: [:show, :edit, :update, :destroy]

  def index
    @dohods = Dohod.all
    respond_with(@dohods)
  end

  def show
    respond_with(@dohod)
  end

  def new
    @dohod = Dohod.new
    respond_with(@dohod)
  end

  def edit
  end

  def create
    @dohod = Dohod.new(dohod_params)
    @dohod.save
    respond_with(@dohod)
  end

  def update
    @dohod.update(dohod_params)
    respond_with(@dohod)
  end

  def destroy
    @dohod.destroy
    respond_with(@dohod)
  end

  private
    def set_dohod
      @dohod = Dohod.find(params[:id])
    end

    def dohod_params
      params.require(:dohod).permit(:schet_id, :cat_dohod_id, :comment, :rab_id, :todate, :cash)
    end
end
