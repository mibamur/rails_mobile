class CreateSchets < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :schets if self.table_exists?("schets")

    create_table :schets do |t|
      t.string :name
      t.belongs_to :login, index: true
      t.boolean :panel
      t.boolean :balance
      t.decimal :cash, precision: 8, scale: 2

      t.timestamps
    end
  end
end
