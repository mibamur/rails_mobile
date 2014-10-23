<% module_namespacing do -%>
class <%= class_name %> < <%= parent_class_name.classify %>

  # extend Enumerize
  # enumerize :some_field, in: [:one, "two", "last"]
  # locale.yml
  # enumerize:
  #   product:
  #     measure:
  #       gramm: "грамм"

  # has_and_belongs_to_many :events

  # audit table changes
  has_paper_trail
  # cattr_reader :per_page
  # @@per_page = 20
<%- attributes.each do |attribute| -%>
  <%- if attribute.name =~ /image/ -%>
  mount_uploader :<%= attribute.name %>, ImageUploader
  <%- end -%>
<%- end -%>
  # TODO paste it to Model Scaffold template  
  #cocoon_marker_start
  #cocoon_marker_data
  #cocoon_marker_end
<% attributes.select(&:reference?).each do |attribute| -%>
  belongs_to :<%= attribute.name %><%= ', polymorphic: true' if attribute.polymorphic? %>
<% end -%>
<% if attributes.any?(&:password_digest?) -%>
  has_secure_password
<% end -%>

  # before_save :do_something

  def self.import(file)
    spread = open_spreadsheet(file)
    spreadsheet = spread.sheet(0)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      <%= singular_table_name %> = find_by_id(row["id"]) || new
      <%= singular_table_name %>.update row.to_hash
      <%= singular_table_name %>.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::Csv.new(file.path)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |<%= singular_table_name %>|
        csv << <%= singular_table_name %>.attributes.values_at(*column_names)
      end
    end
  end

  <%- if attributes[0].name == 'name' -%>
  <%- else -%>
  define_method :name do
  <%- if attributes[0].name =~ /date/ -%>
    <%- if attributes[1].reference? -%>
    "#{self.<%= attributes[0].name %>} #{self.<%= attributes[1].name %>.name}"
    <%- else -%>
    "#{self.<%= attributes[0].name %>}"
    <%- end -%>
  <%- else -%>
  <%- if attributes.first.name =~ /_name/ -%>
    "#{self.last_name} #{self.first_name}"
  <%- else -%>
  <%- if attributes[0].reference? -%>
    <%- if attributes[1].reference? -%>
    "#{self.<%= attributes[0].name %>.name} #{self.<%= attributes[1].name %>.name}"
    <%- else -%>
    "#{self.<%= attributes[0].name %>.name}"
    <%- end -%>
  <%- else -%>
    "#{self.<%= attributes[0].name %>}"
  <%- end -%>
  <%- end -%>
  <%- end -%>
  end
  <%- end -%>

end
<% end -%>
