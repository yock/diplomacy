class RemoveSuperPowerFromMoves < ActiveRecord::Migration
  def up
    remove_column :moves, :super_power
  end

  def down
    add_column :moves, :super_power, :string
  end
end
