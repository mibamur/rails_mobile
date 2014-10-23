class CreateRabs < ActiveRecord::Migration

  # TODO add new [FEATURE]
   def self.table_exists?(name)
     ActiveRecord::Base.connection.tables.include?(name)
   end

  def change
    drop_table :rabs if self.table_exists?("rabs")

    create_table :rabs do |t|
      t.string :first_name
      t.string :last_name
      t.string :tel
      t.belongs_to :login, index: true

      t.timestamps
    end
  end
end
