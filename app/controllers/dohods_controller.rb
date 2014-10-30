class DohodsController < ApplicationController
  before_action :set_dohod, only: [:show, :edit, :update, :destroy]
  ##before_action :redirect_tor
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
    respond_with @dohod do |format|
      format.html { redirect_to root_path }
    end
  end

  def update
    @dohod.update(dohod_params)
    respond_with @dohod do |format|
      format.html { redirect_to root_path }
    end
  end

  def destroy
    @dohod.destroy
    respond_with @dohod do |format|
      format.html { redirect_to root_path }
    end
  end

  private
    def set_dohod
      @dohod = Dohod.find(params[:id])
    end

    def dohod_params
      params.require(:dohod).permit(:schet_id, :cat_dohod_id, :comment, :rab_id, :todate, :cash)
    end

    def redirect_tor
      respond_to do |format|
        format.html {redirect_to root_path}
        #format.js {render :js => "window.location.href='"+root_path+"'"} if params[:q].present?
      end
    end

end
