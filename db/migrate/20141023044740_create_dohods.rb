class CreateDohods < ActiveRecord::Migration
  def change
    create_table :dohods do |t|
      t.belongs_to :schet, index: true
      t.belongs_to :cat_dohod, index: true
      t.text :comment
      t.belongs_to :rab, index: true
      t.date :todate
      t.decimal :cash, precision: 8, scale: 2

      t.timestamps
    end
  end
end
