class Rashod < ActiveRecord::Base
  include ActiveModel::Dirty
  validates :schet_id, presence: true

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
  belongs_to :schet
  belongs_to :cat_rashod
  belongs_to :rab

  # before_save :do_something
  before_save :tocalc
  before_save :init_data
  # after_update :tochange
  after_destroy :tominus


  def self.import(file)
    spread = open_spreadsheet(file)
    spreadsheet = spread.sheet(0)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      rashod = find_by_id(row["id"]) || new
      rashod.update row.to_hash
      rashod.save!
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
      all.each do |rashod|
        csv << rashod.attributes.values_at(*column_names)
      end
    end
  end

  define_method :name do
    "#{self.schet.name} #{self.cat_rashod.name}"
  end

  def tocalc
    if self.schet_id
    calc1=Schet.find(self.schet_id)
    calc1.cash=calc1.cash.to_f-self.cash.to_f
    calc1.save
    # self.schet.cash=self.schet.cash.to_f-self.cash.to_f
    end
  end

  def tominus
    calc2=Schet.find(self.schet_id)
    calc2.cash=calc2.cash.to_f+self.cash.to_f
    calc2.save
  end

  # def tochange; end

  def init_data
    self.todate ||= Date.today if new_record?
  end


end
