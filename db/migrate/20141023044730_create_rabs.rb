class CreateRabs < ActiveRecord::Migration
  def change
    create_table :rabs do |t|
      t.string :first_name
      t.string :last_name
      t.string :tel
      t.belongs_to :login, index: true

      t.timestamps
    end
  end
end
