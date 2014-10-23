class CreateSchets < ActiveRecord::Migration
  def change
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
