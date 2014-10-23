class CreatePerevods < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :perevods if self.table_exists?("perevods")

    create_table :perevods do |t|
      t.integer :schet_from
      t.integer :schet_to
      t.belongs_to :rab, index: true
      t.date :todate
      t.decimal :cash, precision: 18, scale: 2
      t.text :comment

      t.timestamps
    end
  end
end
