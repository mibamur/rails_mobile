class CatRashod < ActiveRecord::Base
  has_many :rashods
  # include TheSortableTree::Scopes
  # acts_as_nested_set

  # include FriendlyId
  # friendly_id :title, :use => [:slugged, :simple_i18n]

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
  # TODO paste it to Model Scaffold template  
  #cocoon_marker_start
  #cocoon_marker_data
  #cocoon_marker_end

  # before_save :do_something

  def self.import(file)
    spread = open_spreadsheet(file)
    spreadsheet = spread.sheet(0)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      cat_rashod = find_by_id(row["id"]) || new
      cat_rashod.update row.to_hash
      cat_rashod.save!
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
      all.each do |cat_rashod|
        csv << cat_rashod.attributes.values_at(*column_names)
      end
    end
  end


end
