# encoding: UTF-8

# Connect to Rails
require './config/environment'

class Cocoon < Thor

  # Parser markers in Model and Controller
  #cocoon_marker_start
  #cocoon_marker_data
  #cocoon_marker_end


 ####                
 #   #               
 #   #  #   #  # ##  
 ####   #   #  ##  # 
 # #    #   #  #   # 
 #  #   #  ##  #   # 
 #   #   ## #  #   # 

  desc "parse", "Parse and paste 'has_many', 'accepts_nested_attributes_for' for Model and 'parent_childs_attributes: [ :id, :etc, :_destroy]' for Controller"
  def parse(name)

    puts "Find model: "+name.to_s

    # Read
    ctrl_file = "app/controllers/#{name}s_controller.rb"
    model_file = "app/models/#{name}.rb"
    ctrl_data = IO.read(ctrl_file)
    model_data = IO.read(model_file)


      ###    #             ##   
     #   #  ####   # ##     #   
     #       #     ##       #   
     #   #   #     #        #   
      ###     ##   #       ###  

    attrs = get_attrs(name) # get Model attrs
    if ctrl_data.gsub!(/\)#cocoon_marker_start/, "#{attrs}" ) # Ins to Ctrl
      puts "Write to attrs to "+ctrl_file
      File.open(ctrl_file, 'w') { |file| file.write("#{ctrl_data}") } # Save to Ctrl
    else
      puts "File "+ctrl_file+" not processing! It`s mean that it already done or have no valid marker, example: ')#cocoon_marker_start' "
    end


    #   #             #          ##   
    ## ##   ###    ####   ###     #   
    # # #  #   #  #   #  #####    #   
    # # #  #   #  #   #  #        #   
    #   #   ###    ####   ###    ###  

    # Search
    ActiveRecord::Base.connection.tables.map do |model|
      model = model.capitalize.singularize.camelize
      e="#{model.underscore}"
      if model =~ /#{name.titleize}/ and not model == "#{name.titleize}"
        # what
        tmp = "has_many :#{e}s\n  accepts_nested_attributes_for :#{e}s, :allow_destroy => true"
        # whare
        model_data.gsub!("#cocoon_marker_data","#{tmp}\n  #cocoon_marker_data") if true
      end
    end
    # Save Model
    # model_data.gsub!("#cocoon_marker_data","") if true
    File.open(model_file, 'w') { |file| file.write("#{model_data}") }

    parse_ul(name)
    parse_tab(name)

    # Mesg
    puts "Done, but check it!"

    # Collect table

  end


 ####                 #     
 #   #                #     
 #   #   ####   ####  #  #  
 ####   #   #  #      # #   
 #   #  #   #  #      ##    
 #   #  #  ##  #      # #   
 ####    ## #   ####  #  #  

  desc "parse_back    [Model]", "Return all making changes for model"
  def parse_back(name)
    parse_back_ctrl(name)
    parse_back_model(name)
  end

  ###   #          ##   
 #     ####  # ##   #   
 #      #    ##     #   
 #      #    #      #   
  ###    ##  #     ###  

  desc "parse_back_ctrl     [Model]", "Undo changes Controller"
  def parse_back_ctrl(name)
    ctrl_file = "app/controllers/#{name}s_controller.rb"
    ctrl_data = IO.read(ctrl_file)
    puts "Restore Controller: "+ctrl_file

    if ctrl_data.match /cocoon_marker_start/
      puts "File "+ctrl_file+" need no backup! Marker '#cocoon_marker_start' is present."
    else

    # puts ctrl_data

      ctrl_data.gsub!(ctrl_data.match(/(.+)(\#cocoon_marker_done)(.+)(\#cocoon_marker_end)(.+)/m)[3],'') if true
      ctrl_data.gsub! '#cocoon_marker_done#cocoon_marker_end', '' if true
      ctrl_data.gsub! ':_destroy,', ':_destroy)#cocoon_marker_start' if true
      File.open(ctrl_file, 'w') { |file| file.write("#{ctrl_data}") }

    end
    puts "Ctrl back Done!"

  end

 #   #             #          ##   
 ## ##   ###    ####   ###     #   
 # # #  #   #  #   #  #####    #   
 # # #  #   #  #   #  #        #   
 #   #   ###    ####   ###    ###  

  desc "parse_back_model    [Model]", "Undo changes Model"
  def parse_back_model(name)
    # 
    model_file = "app/models/#{name}.rb"
    if File.exist?(model_file)
      model_data = IO.read(model_file)
      puts "File "+model_file+" found!"
    else
      puts "File "+model_file+" not found!"
      exit
    end

    puts "Restoring Model: "+model_file

    if model_data.match /cocoon_marker_data/
      puts "File "+model_file+" need no backup!  Marker '#cocoon_marker_data' is present."
    else
      model_data.gsub!(model_data.match(/(.+)(\#cocoon_marker_start)(.+)(\#cocoon_marker_end)(.+)/m)[3],'') if true
      model_data.gsub! '#cocoon_marker_start#cocoon_marker_end', "\#cocoon_marker_start\n  \#cocoon_marker_data\n  \#cocoon_marker_end" if true
      File.open(model_file, 'w') { |file| file.write("#{model_data}") }
    end
    puts "Undo Done!"
  end


  ###    #             ##             #     #      #                  
 #   #  ####   # ##     #            # #   ####   ####   # ##    #### 
 #       #     ##       #           #   #   #      #     ##     ###   
 #   #   #     #        #           #####   #      #     #        ### 
  ###     ##   #       ###          #   #    ##     ##   #      ####  

  desc "get_attrs [NAME]", "get_attrs for Rails 4 to Parent Controller from Childrens"
  method_options :force => :boolean
  def get_attrs(name)


    # Find all match model
    attrs_ar=[]
    ActiveRecord::Base.connection.tables.map do |model|
      model = model.capitalize.singularize.camelize
      attrs=""
      # puts model
      if model =~ /#{name.titleize}/ and not model == "#{name.titleize}"
        attrs="#{model.underscore}s_attributes: [:id"
        # send("#{self.class.yaffle_text_field}=", string.to_squawk)
        eval(model).new.attributes.keys.each { |e| attrs=attrs+", :"+e if not e =~ /created_at|updated_at|#{name}_id/ }
        attrs=attrs+"]"
        attrs_ar << attrs
      end
    end

    attrs=" "

    if attrs_ar.size == 0
        puts "Children model for: "+name+" - Not found! You should name it like: "+name+"_children"
        exit
    end
    attrs_ar.each { |e| 
      attrs=attrs+"\n\t\t"+e.sub(":id",":_destroy")+", "
    }
    attrs=",\n#cocoon_marker_done"+attrs[0..-3]+")\n\t\t\#cocoon_marker_end"
    return attrs
    # puts attrs
  end


 #   #                 ##   
 #   #   ####  ## #     #   
 #####  #   #  # # #    #   
 #   #  #  ##  # # #    #   
 #   #   ## #  #   #   ###  

                                            #            #     
 ####    ####  # ##    ####   ###          ####    ####  ####  
 #   #  #   #  ##     ###    #####          #     #   #  #   # 
 #   #  #  ##  #        ###  #              #     #  ##  #   # 
 ####    ## #  #      ####    ###            ##    ## #  ####  
 #                                  #####                      

  desc "parse_tab [NAME]", "get_childrens for Parent Childrens"
  def parse_tab(name)

    form_file = "app/views/#{name}s/forms/_form.html.haml"
    form_data = IO.read(form_file)

    tab_template_all=""
    ActiveRecord::Base.connection.tables.map do |model|
      old_model = model
      model = model.capitalize.singularize.camelize
      if model =~ /#{name.titleize}/ and not model == "#{name.titleize}"
        tab_template_all=tab_template_all+"      = render partial: \""+ old_model +"/cocoon/tab\", f: f, locals: { f: f }\n"
      end
    end
    form_data.sub!("      - 'TABB'",tab_template_all+"      - 'TABB'")
    File.open(form_file, 'w') { |file| file.write("#{form_data}") }

  end


                                                   ##   
 ####    ####  # ##    ####   ###          #   #    #   
 #   #  #   #  ##     ###    #####         #   #    #   
 #   #  #  ##  #        ###  #             #  ##    #   
 ####    ## #  #      ####    ###           ## #   ###  
 #                                  #####               

  desc "parse_ul [NAME]", "get_childrens for Parent Childrens"
  def parse_ul(name)

    tab_ul_data_template_all=""
    tab_ul_file = "app/views/#{name}s/forms/_tab_ul.html.haml"
    tab_ul_data = IO.read(tab_ul_file)

    ActiveRecord::Base.connection.tables.map do |model|
      old_model = model
      model = model.capitalize.singularize.camelize
      if model =~ /#{name.titleize}/ and not model == "#{name.titleize}"
        tab_ul_data_template= "  %li\n    = render partial: \""+ old_model +"/forms/tab_li\"\n"
        tab_ul_data_template_all=tab_ul_data_template_all+tab_ul_data_template
      end
    end

    tab_ul_data.sub!("- 'LI'",tab_ul_data_template_all+"\n= ''")
    File.open(tab_ul_file, 'w') { |file| file.write("#{tab_ul_data}") }

  end

# rails g scaffold tab name rab:belongs_to date time shift:boolean price:decimal{8-2} -f
# rails g scaffold tab_other name rab:belongs_to tab:belongs_to date time shift:boolean price:decimal{8-2} -f
# rails g scaffold tab_double name rab:belongs_to tab:belongs_to date time shift:boolean price:decimal{8-2} -f
# thor cocoon:parse tab



# usefull links
# http://regexponline.com/
# p email.match(/(.+)@(.+)\.(.+)/i) # 1=> user, 2 => subdomain, 3 => root_domain
# http://rubular.com/
# http://regex101.com/
# TODO make Dart port
# https://github.com/ryan-endacott/verbal_expressions

end
