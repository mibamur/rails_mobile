class AddOdinToCatDohods < ActiveRecord::Migration
  def change
    add_column :cat_dohods, :odin, :boolean
  end
end
