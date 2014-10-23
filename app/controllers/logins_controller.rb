class LoginsController < ApplicationController
  before_action :set_login, only: [:edit, :update, :destroy]

  def index
    @logins = Login.all
  end
  def show
  end
  def new
    @login = Login.new
  end
  def edit
  end
  def create
    @login = Login.new(login_params)

    respond_to do |format|
      if @login.save
        format.html { redirect_to @login, notice: 'Login was successfully created.' }
        format.json { render :show, status: :created, location: @login }
      else
        format.html { render :new }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logins/1
  # PATCH/PUT /logins/1.json
  # def update
  #   respond_to do |format|
  #     if @login.update(login_params)
  #       format.html { redirect_to @login, notice: 'Login was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @login }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @login.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /logins/1
  # PATCH/PUT /logins/1.json
  def update

    if login_params[:password].blank?
      login_params.delete(:password)
      login_params.delete(:password_confirmation)
    end

    # https://github.com/plataformatec/devise/wiki/How-To%3a-Allow-logins-to-edit-their-account-without-providing-a-password
    # successfully_updated = if needs_password?(@login, login_params)
                           #   @login.update(login_params)
                           # else
                           #   @login.update_without_password(login_params)
                           # end

    respond_to do |format|
      # if successfully_updated
      if @login.update(login_params)
        format.html { redirect_to @login, notice: 'login was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /logins/1
  # DELETE /logins/1.json
  def destroy
    @login.destroy
    respond_to do |format|
      format.html { redirect_to logins_url, notice: 'Login was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_login
      @login = Login.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def login_params
      params.require(:login).permit(:email, :password, :password_confirmation)
    end
end



