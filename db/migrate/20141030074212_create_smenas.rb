class CreateSmenas < ActiveRecord::Migration


  def change

    create_table :smenas do |t|
      t.boolean :open
      t.date :todate
      t.belongs_to :schet, index: true

      t.timestamps
    end
  end
end
