require 'rails/generators/erb/scaffold/scaffold_generator'

# /home/debadmin/RubymineProjects/bill/lib/templates/haml/scaffold
# /home/debadmin/RubymineProjects/bill/lib/generators/haml/scaffold/templates
# /home/debadmin/RubymineProjects/bill/lib/templates/erb/scaffold



module Haml
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
      source_root File.expand_path("../templates", __FILE__)

      # def copy_view_files
      #   available_views.each do |view|
      #     filename = filename_with_extensions(view)
      #     template "#{view}.html.haml", File.join("app/views", controller_file_path, filename)
      #   end
      # end

      # def copy_js_files
      #   available_js.each do |js|
      #     filename = "#{js}.js.haml"
      #     template "#{js}.js.haml", File.join("app/views", controller_file_path, filename)
      #   end
      # end

      # def copy_import_export_files
      #   available_import_export.each do |import_export|
      #     filename = import_export
      #     template import_export, File.join("app/views", controller_file_path, filename)
      #   end
      # end


      def copy_view_files
        available_views.each do |filename|
          template filename, File.join("app/views", controller_file_path, filename)
        end
      end


      hook_for :form_builder, :as => :scaffold

      def copy_form_file
        if options[:form_builder].nil?
          filename = './_form.html.haml' #filename_with_extensions("_form")
          template filename, File.join("app/views", controller_file_path, filename)
        end
      end


    protected

      def available_views
        # %w(index edit show new _modal _form_small _error _f_password _SUNGULAR_fields _form_tabs _form_tabs_js _datatable_js _table_row _table_th _table_tr_action _import_export _reference_select2_ajax_js _panel_heading)
        %w(
          ./destroy.js.haml
          ./show.html.haml
          ./edit.html.haml
          ./index.html.haml
          ./show.js.haml
          ./new.html.haml
          )


      end

      def handler
        :haml
      end

    end
  end
end



      # def available_js
      #   %w(destroy show)
      # end
      # def available_import_export
      #   %w(index.xls.erb index.xlsx.erb index.xlsx.axlsx)
      # end
