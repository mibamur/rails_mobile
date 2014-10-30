class CatDohodsController < ApplicationController
  before_action :set_cat_dohod, only: [:show, :edit, :update, :destroy]
  ##before_action :redirect_tor


  def index
    @cat_dohods = CatDohod.all
    respond_with(@cat_dohods)
  end

  def show
    respond_with(@cat_dohod)
  end

  def new
    @cat_dohod = CatDohod.new
    respond_with(@cat_dohod)
  end

  def edit
  end

  def create
    @cat_dohod = CatDohod.new(cat_dohod_params)
    @cat_dohod.save
    # respond_with(@cat_dohod)
    respond_with @cat_dohod do |format|
      format.html { redirect_to root_path }
    end
  end

  def update
    @cat_dohod.update(cat_dohod_params)
    respond_with @cat_dohod do |format|
      format.html { redirect_to root_path }
    end
  end

  def destroy
    @cat_dohod.destroy
    respond_with @cat_dohod do |format|
      format.html { redirect_to root_path }
    end
  end

  private
    def set_cat_dohod
      @cat_dohod = CatDohod.find(params[:id])
    end

    def cat_dohod_params
      params.require(:cat_dohod).permit(:name, :odin)
    end

    def redirect_tor
      respond_to do |format|
        format.html {redirect_to root_path}
        #format.js {render :js => "window.location.href='"+root_path+"'"} if params[:q].present?
      end
    end


end
