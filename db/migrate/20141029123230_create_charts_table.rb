class CreateChartsTable < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :charts_tables if self.table_exists?("charts_tables")

    create_table :charts_tables do |t|
      t.string :name

      t.timestamps
    end
  end
end
