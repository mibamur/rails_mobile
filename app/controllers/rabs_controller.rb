class RabsController < ApplicationController
  before_action :set_rab, only: [:show, :edit, :update, :destroy]
  ##before_action :redirect_tor

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

    respond_with @rab do |format|
      format.html { redirect_to root_path }
    end

  end

  def update
    @rab.update(rab_params)
    respond_with @rab do |format|
      format.html { redirect_to root_path }
    end
  end

  def destroy
    @rab.destroy
    respond_with @rab do |format|
      format.html { redirect_to root_path }
    end
  end

  private
    def set_rab
      @rab = Rab.find(params[:id])
    end

    def rab_params
      params.require(:rab).permit(:first_name, :last_name, :tel, :doljn)
    end

    def redirect_tor
      respond_to do |format|
        format.html {redirect_to root_path}
        #format.js {render :js => "window.location.href='"+root_path+"'"} if params[:q].present?
      end
    end

end
