class CreateSmenaShtrafs < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :smena_shtrafs if self.table_exists?("smena_shtrafs")

    create_table :smena_shtrafs do |t|
      t.belongs_to :smena, index: true
      t.belongs_to :rab, index: true
      t.decimal :cash, precision: 8, scale: 2
      t.text :comment

      t.timestamps
    end
  end
end
