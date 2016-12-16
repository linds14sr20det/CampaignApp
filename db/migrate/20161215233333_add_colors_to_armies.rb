class AddColorsToArmies < ActiveRecord::Migration[5.0]
  def change
    add_column :armies, :color, :string
  end
end
