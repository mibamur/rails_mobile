class CreateSmenaRabs < ActiveRecord::Migration


  def change

    create_table :smena_rabs do |t|
      t.belongs_to :smena, index: true
      t.belongs_to :rab, index: true
      t.boolean :allday
      t.string :time_start
      t.string :time_end

      t.timestamps
    end
  end
end
