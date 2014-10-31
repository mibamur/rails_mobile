class CreateSmenaShtrafs < ActiveRecord::Migration


  def change

    create_table :smena_shtrafs do |t|
      t.belongs_to :smena, index: true
      t.belongs_to :rab, index: true
      t.decimal :cash, precision: 8, scale: 2
      t.text :comment

      t.timestamps
    end
  end
end
