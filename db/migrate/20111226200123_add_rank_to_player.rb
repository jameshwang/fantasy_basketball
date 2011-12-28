class AddRankToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :rank, :float
  end
end
