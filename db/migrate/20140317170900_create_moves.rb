class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :request

      t.timestamps
    end
  end
end
