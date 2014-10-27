class Perevod < ActiveRecord::Base
  include ActiveModel::Dirty
  validates :schet_from, presence: true
  validates :schet_to, presence: true

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
  belongs_to :rab

  # before_save :perevoddo
  before_save :tocalc
  # after_update :tochange
  after_destroy :tominus

  def self.import(file)
    spread = open_spreadsheet(file)
    spreadsheet = spread.sheet(0)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      perevod = find_by_id(row["id"]) || new
      perevod.update row.to_hash
      perevod.save!
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
      all.each do |perevod|
        csv << perevod.attributes.values_at(*column_names)
      end
    end
  end

  define_method :name do
    "#{self.schet_from}"
  end

  def tocalc
      #self.cash
      from1=Schet.find(self.schet_from)
      from1.cash=from1.cash.to_f-self.cash.to_f
      from1.save

      to1=Schet.find(self.schet_to)
      to1.cash=to1.cash.to_f+self.cash.to_f
      to1.save
  end

  def tominus
  #   from2=Schet.find(self.schet_id)
  #   from2.cash=from2.cash.to_f-self.cash.to_f
  #   from2.save

    from2=Schet.find(self.schet_from)
    from2.cash=from2.cash.to_f+self.cash.to_f
    from2.save

    to1=Schet.find(self.schet_to)
    to1.cash=to1.cash.to_f-self.cash.to_f
    to1.save

  end



end
