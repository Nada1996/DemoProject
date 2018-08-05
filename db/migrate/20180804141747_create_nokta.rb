class CreateNokta < ActiveRecord::Migration[5.2]
  def change
    create_table :nokta do |t|
      t.string :body, limit: 200
      t.integer :user_id

      t.timestamps
    end
  end
end
