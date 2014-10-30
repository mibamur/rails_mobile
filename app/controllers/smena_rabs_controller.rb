class SmenaRabsController < ApplicationController
  before_action :set_smena_rab, only: [:show, :edit, :update, :destroy]

  def index
    @smena_rabs = SmenaRab.all
    respond_with(@smena_rabs)
  end

  def show
    respond_with(@smena_rab)
  end

  def new
    @smena_rab = SmenaRab.new
    respond_with(@smena_rab)
  end

  def edit
  end

  def create
    @smena_rab = SmenaRab.new(smena_rab_params)
    @smena_rab.save
    respond_with(@smena_rab)
  end

  def update
    @smena_rab.update(smena_rab_params)
    respond_with(@smena_rab)
  end

  def destroy
    @smena_rab.destroy
    respond_with(@smena_rab)
  end

  private
    def set_smena_rab
      @smena_rab = SmenaRab.find(params[:id])
    end

    def smena_rab_params
      params.require(:smena_rab).permit(:smena_id, :rab_id, :allday, :time_start, :time_end)
    end
end
