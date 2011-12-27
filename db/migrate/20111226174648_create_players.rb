class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :player_name
      t.string :owner_name
      t.float :fg_percentage
      t.float :ft_percentage
      t.integer :three_pts
      t.integer :reb
      t.integer :ast
      t.integer :stl
      t.integer :blk
      t.integer :to
      t.integer :pts

      t.timestamps
    end
  end
end
