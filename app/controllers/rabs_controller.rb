class RabsController < ApplicationController
  before_action :set_rab, only: [:show, :edit, :update, :destroy]

  def index
    @rabs = Rab.all
    respond_with(@rabs)
  end

  def show
    respond_with(@rab)
  end

  def new
    @rab = Rab.new
    respond_with(@rab)
  end

  def edit
  end

  def create
    @rab = Rab.new(rab_params)
    @rab.save
    respond_with(@rab)
  end

  def update
    @rab.update(rab_params)
    respond_with(@rab)
  end

  def destroy
    @rab.destroy
    respond_with(@rab)
  end

  private
    def set_rab
      @rab = Rab.find(params[:id])
    end

    def rab_params
      params.require(:rab).permit(:first_name, :last_name, :tel, :login_id)
    end
end
