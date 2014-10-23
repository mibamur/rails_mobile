class SchetsController < ApplicationController
  before_action :set_schet, only: [:show, :edit, :update, :destroy]
  ##before_action :redirect_tor

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

    def redirect_tor
      respond_to do |format|
        format.html {redirect_to root_path}
        #format.js {render :js => "window.location.href='"+root_path+"'"} if params[:q].present?
      end
    end

end
