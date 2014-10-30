class PerevodsController < ApplicationController
  before_action :set_perevod, only: [:show, :edit, :update, :destroy]
  ##before_action :redirect_tor

  def index
    @perevods = Perevod.all
    respond_with(@perevods)
  end

  def show
    respond_with(@perevod)
  end

  def new
    @perevod = Perevod.new
    respond_with(@perevod)
  end

  def edit
  end

  def create
    @perevod = Perevod.new(perevod_params)
    @perevod.save
    respond_with @perevod do |format|
      format.html { redirect_to root_path }
    end

  end

  def update
    @perevod.update(perevod_params)
    respond_with @perevod do |format|
      format.html { redirect_to root_path }
    end
  end

  def destroy
    @perevod.destroy
    respond_with @perevod do |format|
      format.html { redirect_to root_path }
    end
  end

  private
    def set_perevod
      @perevod = Perevod.find(params[:id])
    end

    def perevod_params
      params.require(:perevod).permit(:schet_from, :schet_to, :rab_id, :todate, :cash, :comment)
    end

    def redirect_tor
      respond_to do |format|
        format.html {redirect_to root_path}
        #format.js {render :js => "window.location.href='"+root_path+"'"} if params[:q].present?
      end
    end


end
