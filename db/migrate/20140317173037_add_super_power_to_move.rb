class AddSuperPowerToMove < ActiveRecord::Migration
  def change
    add_column :moves, :super_power, :string
  end
end
