class CreatePerevods < ActiveRecord::Migration
  def change
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
