class CreateSmenaRabs < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :smena_rabs if self.table_exists?("smena_rabs")

    create_table :smena_rabs do |t|
      t.belongs_to :smena, index: true
      t.belongs_to :rab, index: true
      t.boolean :allday
      t.time :time_start
      t.time :time_end

      t.timestamps
    end
  end
end
