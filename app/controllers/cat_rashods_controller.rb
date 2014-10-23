class CatRashodsController < ApplicationController
  before_action :set_cat_rashod, only: [:show, :edit, :update, :destroy]

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
    respond_with(@cat_rashod)
  end

  def update
    @cat_rashod.update(cat_rashod_params)
    respond_with(@cat_rashod)
  end

  def destroy
    @cat_rashod.destroy
    respond_with(@cat_rashod)
  end

  private
    def set_cat_rashod
      @cat_rashod = CatRashod.find(params[:id])
    end

    def cat_rashod_params
      params.require(:cat_rashod).permit(:name)
    end
end
