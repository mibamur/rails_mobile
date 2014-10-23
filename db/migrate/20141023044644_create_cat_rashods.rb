class CreateCatRashods < ActiveRecord::Migration
  def change
    create_table :cat_rashods do |t|
      t.string :name

      t.timestamps
    end
  end
end
