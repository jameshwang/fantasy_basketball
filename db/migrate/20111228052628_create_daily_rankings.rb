class CreateDailyRankings < ActiveRecord::Migration
  def change
    create_table :daily_rankings do |t|
      t.integer :rank
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
      t.float :tot_points
      t.boolean :ignore_flag
      
      t.timestamps
    end
  end
end
