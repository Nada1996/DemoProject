class AddHiddenToNokta < ActiveRecord::Migration[5.2]
  def change
    add_column :nokta, :hidden, :boolean, :default => false
  end
end
