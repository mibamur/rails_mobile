class SmenasController < ApplicationController
  before_action :set_smena, only: [:show, :edit, :update, :destroy]

  def index
    @smenas = Smena.all
    respond_with(@smenas)
  end

  def show
    respond_with(@smena)
  end

  def new
    @smena = Smena.new
    respond_with(@smena)

    # respond_with @smena do |format|
    #   format.html { redirect_to root_path }
    # end

  end

  def edit
  end

  def create
    @smena = Smena.new(smena_params)
    @smena.save
    # respond_with(@smena)
    respond_with @smena do |format|
      format.html { redirect_to root_path }
    end
  end

  def update
    @smena.update(smena_params)
    respond_with @smena do |format|
      format.html { redirect_to root_path }
    end
  end

  def destroy
    @smena.destroy
    respond_with @smena do |format|
      format.html { redirect_to root_path }
    end
  end

  private
    def set_smena
      @smena = Smena.find(params[:id])
    end

    def smena_params
      params.require(:smena).permit(:open, :todate, :schet_id,
        smena_rabs_attributes: [:_destroy, :id, :rab_id, :allday, :time_start, :time_end], 
        smena_shtrafs_attributes: [:_destroy, :id, :rab_id, :cash, :comment], 
        )
    end

end