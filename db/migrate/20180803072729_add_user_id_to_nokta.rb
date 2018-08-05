class AddUserIdToNokta < ActiveRecord::Migration[5.2]
  def change
    add_column :nokta, :user_id, :integer

  end
end
