class CreateSmenas < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :smenas if self.table_exists?("smenas")

    create_table :smenas do |t|
      t.boolean :open
      t.date :todate
      t.belongs_to :schet, index: true

      t.timestamps
    end
  end
end
