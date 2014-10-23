class CreateCatDohods < ActiveRecord::Migration
  def change
    create_table :cat_dohods do |t|
      t.string :name

      t.timestamps
    end
  end
end
