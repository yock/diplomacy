class AddTurnToMoves < ActiveRecord::Migration
  def change
    add_column :moves, :turn, :integer
  end
end
