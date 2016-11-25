class AddGameScoreToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :game_score, :integer, default: 0
  end
end
