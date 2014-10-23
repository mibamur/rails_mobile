class DialogController < ApplicationController
  layout 'devise'
  before_action :set_rashod, only: [:show, :edit, :update, :destroy]
  before_action :set_dohod, only: [:show, :edit, :update, :destroy]
  before_action :set_perevod, only: [:show, :edit, :update, :destroy]


  def index
    
    @schets = Schet.where(panel: true).all
    @dohod = Dohod.new
    @rashod = Rashod.new
    @perevod = Perevod.new

     respond_to do |format|
      format.html
      format.json
    end

  end

  def new
    @dohod = Dohod.new
    @rashod = Rashod.new
    @perevod = Perevod.new
  end

  # POST /rashods
  def create
    @rashod  = Rashod.new(rashod_params)
    @dohod   = Dohod.new(dohod_params)
    @perevod = Perevod.new(perevod_params)

    respond_to do |format|
      if @rashod.save
        format.html { redirect_to '/' }
        format.json { render action: 'show', status: :created, location: @rashod }
        format.js   { render action: 'show', status: :created, location: @rashod }
      end
      if @dohod.save
        format.html { redirect_to '/' }
        format.json { render action: 'show', status: :created, location: @rashod }
        format.js   { render action: 'show', status: :created, location: @rashod }
      end
      if @perevod.save
        format.html { redirect_to '/' }
        format.json { render action: 'show', status: :created, location: @rashod }
        format.js   { render action: 'show', status: :created, location: @rashod }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rashod
      @rashod = Rashod.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rashod_params
      params.require(:rashod).permit( :schet_id, :cat_rashod_id, :comment, :rab_id, :todate, :cash, :_import, :_update, :_create, :_destroy)#cocoon_marker_start
    end

    def set_dohod
      @dohod = Dohod.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dohod_params
      params.require(:dohod).permit( :schet_id, :cat_dohod_id, :comment, :rab_id, :todate, :cash, :_import, :_update, :_create, :_destroy)#cocoon_marker_start
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_perevod
      @perevod = Perevod.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def perevod_params
      params.require(:perevod).permit( :schet_from, :schet_to, :rab_id, :todate, :cash, :comment, :_import, :_update, :_create, :_destroy)#cocoon_marker_start
    end

end
