class CatRashodsController < ApplicationController
  before_action :set_cat_rashod, only: [:show, :edit, :update, :destroy]
  ##before_action :redirect_tor

  def index
    @cat_rashods = CatRashod.all
    respond_with(@cat_rashods)
  end

  def show
    respond_with(@cat_rashod)
  end

  def new
    @cat_rashod = CatRashod.new
    respond_with(@cat_rashod)
  end

  def edit
  end

  def create
    @cat_rashod = CatRashod.new(cat_rashod_params)
    @cat_rashod.save
    respond_with @cat_rashod do |format|
      format.html { redirect_to root_path }
    end
  end

  def update
    @cat_rashod.update(cat_rashod_params)
    respond_with @cat_rashod do |format|
      format.html { redirect_to root_path }
    end
  end

  def destroy
    @cat_rashod.destroy
    respond_with @cat_rashod do |format|
      format.html { redirect_to root_path }
    end
  end

  private
    def set_cat_rashod
      @cat_rashod = CatRashod.find(params[:id])
    end

    def cat_rashod_params
      params.require(:cat_rashod).permit(:name, :odin)
    end

    def redirect_tor
      respond_to do |format|
        format.html {redirect_to root_path}
        #format.js {render :js => "window.location.href='"+root_path+"'"} if params[:q].present?
      end
    end


end
