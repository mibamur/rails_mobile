class CreateCatDohods < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :cat_dohods if self.table_exists?("cat_dohods")

    create_table :cat_dohods do |t|
      t.string :name

      t.timestamps
    end
  end
end
