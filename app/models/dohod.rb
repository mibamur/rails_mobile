class Dohod < ActiveRecord::Base
  include ActiveModel::Dirty
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
  belongs_to :cat_dohod
  belongs_to :rab

  #before_filter :require_login
  # define_attribute_methods :cash

  # def cash
  #   @cash
  # end
  # def cash=(value)
  #   cash_will_change!
  #   @cash = value
  # end

  # before_save :do_something
  before_save :tocalc
  # after_update :tochange
  after_destroy :tominus

  def self.import(file)
    spread = open_spreadsheet(file)
    spreadsheet = spread.sheet(0)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      dohod = find_by_id(row["id"]) || new
      dohod.update row.to_hash
      dohod.save!
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
      all.each do |dohod|
        csv << dohod.attributes.values_at(*column_names)
      end
    end
  end

  def name
    "#{self.schet.name} #{self.cat_dohod.name}"
    # "ПУСТО"
  end

  def tocalc
    from1=Schet.find(self.schet_id)
    from1.cash=from1.cash.to_f+self.cash.to_f
    from1.save
    # self.schet.cash=self.schet.cash.to_f+self.cash.to_f
  end

  def tominus
    from2=Schet.find(self.schet_id)
    from2.cash=from2.cash.to_f-self.cash.to_f
    from2.save
  end

  # def tochange

    # if self.cash_changed?
    #   from3=Schet.find(self.schet_id)
    #   from3.cash=from3.cash.to_f-self.previous_changes[:cash].to_f+self.cash.to_f
    #   self.comment=self.previous_changes.to_s
    #   from3.save
    # end
  # end


# def bar=(value)
#   @bar_changed = true
#   @bar = value
# end

# def bar_changed?
#   if @bar_changed
#     @bar_changed = false
#     return true
#   else
#     return false
#   end
# end

end
