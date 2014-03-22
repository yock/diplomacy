class RemoveGameAndAddPlayerToMove < ActiveRecord::Migration
  def up
    remove_column :moves, :game_id
    add_column :moves, :player_id, :integer
  end

  def down
    remove_column :moves, :player_id
    add_column :moves, :game_id, :integer
  end
end
