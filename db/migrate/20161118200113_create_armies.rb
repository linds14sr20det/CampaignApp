class CreateArmies < ActiveRecord::Migration[5.0]
  def change
    create_table :armies do |t|
      t.text :name

      t.timestamps
    end
  end
end
