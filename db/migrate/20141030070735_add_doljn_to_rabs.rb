class AddDoljnToRabs < ActiveRecord::Migration
  def change
    add_column :rabs, :doljn, :string
  end
end
