class AddOdinToCatRashods < ActiveRecord::Migration
  def change
    add_column :cat_rashods, :odin, :boolean
  end
end
