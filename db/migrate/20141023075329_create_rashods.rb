class CreateRashods < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :rashods if self.table_exists?("rashods")

    create_table :rashods do |t|
      t.belongs_to :schet, index: true
      t.belongs_to :cat_rashod, index: true
      t.text :comment
      t.belongs_to :rab, index: true
      t.date :todate
      t.decimal :cash, precision: 8, scale: 2

      t.timestamps
    end
  end
end
