class CreateRabImages < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :rab_images if self.table_exists?("rab_images")

    create_table :rab_images do |t|
      t.string :image
      t.belongs_to :rab, index: true

      t.timestamps
    end
  end
end
