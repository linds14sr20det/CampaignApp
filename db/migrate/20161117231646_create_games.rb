class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.boolean :win
      t.references :user, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
    add_index :games, [:user_id, :created_at]
    add_index :games, [:location_id, :created_at]
  end
end
