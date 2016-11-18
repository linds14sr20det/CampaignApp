class AddArmiesToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :user_army_id, :integer
    add_index :games, :user_army_id
    add_column :games, :opponent_army_id, :integer
    add_index :games, :opponent_army_id
  end
end
