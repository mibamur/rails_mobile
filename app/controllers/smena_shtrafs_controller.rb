class SmenaShtrafsController < ApplicationController
  before_action :set_smena_shtraf, only: [:show, :edit, :update, :destroy]

  def index
    @smena_shtrafs = SmenaShtraf.all
    respond_with(@smena_shtrafs)
  end

  def show
    respond_with(@smena_shtraf)
  end

  def new
    @smena_shtraf = SmenaShtraf.new
    respond_with(@smena_shtraf)
  end

  def edit
  end

  def create
    @smena_shtraf = SmenaShtraf.new(smena_shtraf_params)
    @smena_shtraf.save
    respond_with(@smena_shtraf)
  end

  def update
    @smena_shtraf.update(smena_shtraf_params)
    respond_with(@smena_shtraf)
  end

  def destroy
    @smena_shtraf.destroy
    respond_with(@smena_shtraf)
  end

  private
    def set_smena_shtraf
      @smena_shtraf = SmenaShtraf.find(params[:id])
    end

    def smena_shtraf_params
      params.require(:smena_shtraf).permit(:smena_id, :rab_id, :cash, :comment)
    end
end
