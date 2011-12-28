class CreateDailyStandings < ActiveRecord::Migration
  def change
    create_table :daily_standings do |t|
      t.integer :rk
      t.string :team
      t.float :fg
      t.float :ft
      t.float :three_pm
      t.float :reb
      t.float :ast
      t.float :stl
      t.float :blk
      t.float :to
      t.float :pts
      t.integer :gp
      t.integer :move

      t.timestamps
    end
  end
end
