class CreateRabImages < ActiveRecord::Migration
  def change
    create_table :rab_images do |t|
      t.string :image
      t.belongs_to :rab, index: true

      t.timestamps
    end
  end
end
