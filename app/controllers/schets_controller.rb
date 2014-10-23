class SchetsController < ApplicationController
  before_action :set_schet, only: [:show, :edit, :update, :destroy]

  def index
    @schets = Schet.all
    respond_with(@schets)
  end

  def show
    respond_with(@schet)
  end

  def new
    @schet = Schet.new
    respond_with(@schet)
  end

  def edit
  end

  def create
    @schet = Schet.new(schet_params)
    @schet.save
    respond_with(@schet)
  end

  def update
    @schet.update(schet_params)
    respond_with(@schet)
  end

  def destroy
    @schet.destroy
    respond_with(@schet)
  end

  private
    def set_schet
      @schet = Schet.find(params[:id])
    end

    def schet_params
      params.require(:schet).permit(:name, :login_id, :panel, :balance, :cash)
    end
end
