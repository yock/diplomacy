class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :super_power

      t.timestamps
    end
  end
end
