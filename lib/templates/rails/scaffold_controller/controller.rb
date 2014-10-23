require 'csv'
<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]

  add_breadcrumb I18n.t(:<%= singular_table_name %>s), :<%= singular_table_name %>s_path
  add_breadcrumb I18n.t(:new), '', :only => [:new, :create]
  add_breadcrumb I18n.t(:edit), '', :only => [:edit, :update]

  # GET <%= route_url %>
  def index
    # if we have plan to use paginate
    # @<%= plural_table_name %> = <%= class_name %>.paginate :page => params[:page], :order => 'id DESC'
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>

    respond_to do |format|
      format.html
      format.csv { send_data @<%= singular_table_name %>s.to_csv }
      format.xls
      format.xlsx
      format.json
      # { send_data @<%= singular_table_name %>.to_csv(col_sep: "\t") }
    end


  end

  # GET <%= route_url %>/1
  def show
    @<%= singular_table_name %> = <%= class_name %>.find(params[:id])
    add_breadcrumb @<%= singular_table_name %>.name, ''
  end

  # GET <%= route_url %>/new
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
  end

  # GET <%= route_url %>/1/edit
  def edit
    add_breadcrumb @<%= singular_table_name %>.name, ''
  end

  # POST <%= route_url %>
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>

    respond_to do |format|
      if @<%= orm_instance.save %>
        format.html { redirect_to <%= singular_table_name %>s_path, notice: "Запись #{@<%= singular_table_name %>.name} создана." }
        format.json { render action: 'show', status: :created, location: @<%= singular_table_name %> }
        format.js   { render action: 'show', status: :created, location: @<%= singular_table_name %> }
      else
        format.html { render action: 'new' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
        format.js   { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT <%= route_url %>/1
  def update
    respond_to do |format|
      if @<%= orm_instance.update("#{singular_table_name}_params") %>
        # redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully updated.'" %>
        format.html { redirect_to <%= singular_table_name %>s_path, notice: "Запись #{@<%= singular_table_name %>.name} обновлена." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @<%= singular_table_name %>.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE <%= route_url %>/1
  def destroy
    @<%= singular_table_name %>_id = params[:id]
    <%= class_name %>.find(@<%= singular_table_name %>_id).destroy
    respond_to do |format|
      format.html { redirect_to <%= singular_table_name %>s_url, notice: "Запись #{@<%= singular_table_name %>.name} удалена." }
      format.js { render :layout=>false }
      format.json { head :no_content }
    end

    # @<%= orm_instance.destroy %>
    # redirect_to <%= index_helper %>_url, notice: <%= "'#{human_name} was successfully destroyed.'" %>
  end

  def import
    <%= class_name %>.import(params[:file])
    redirect_to <%= singular_table_name %>s_path, notice: "Импорт прошёл."
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    end

    # Only allow a trusted parameter "white list" through.
    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params[<%= ":#{singular_table_name}" %>]
      <%- else -%>
      params.require(<%= ":#{singular_table_name}" %>).permit( <%= attributes_names.map { |name| ":#{name}" }.join(', ') %>, :_import, :_update, :_create, :_destroy)#cocoon_marker_start
      <%- end -%>
    end
end
<% end -%>
