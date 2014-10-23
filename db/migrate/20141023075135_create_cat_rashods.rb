class CreateCatRashods < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :cat_rashods if self.table_exists?("cat_rashods")

    create_table :cat_rashods do |t|
      t.string :name

      t.timestamps
    end
  end
end
