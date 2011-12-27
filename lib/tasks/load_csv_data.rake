namespace :db do
  desc "load player data from csv"
  task :load_csv_data => :environment do
    require 'fastercsv'
    
    FasterCSV.foreach("data.csv") do |row|
      Player.create(
        :player_name => row[0], 
        :owner_name => row[1], 
        :fg_percentage => row[2], 
        :ft_percentage => row[3], 
        :three_pts => row[4], 
        :reb => row[5], 
        :ast => row[6], 
        :stl => row[7], 
        :blk => row[8], 
        :to => row[9], 
        :pts => row[10]
      )
      
    end
  end
  
  desc "assign ranking for each player"
  task :assign_ranking => :environment do
    fg_percentage_avg = 0.4796
    fg_percentage_std = 0.0059
    ft_percentage_avg = 0.7878
    ft_percentage_std = 0.0188
    three_pts_avg = 467.9
    three_pts_std = 89.0
    reb_avg = 3506.1
    reb_std = 184.7
    ast_avg = 2029.0
    ast_std = 249.4
    stl_avg = 610.4
    stl_std = 68.3
    blk_avg = 416.9
    blk_std = 96.2
    to_avg = 1189.4
    to_std = 57.9
    pts_avg = 9385.2
    pts_std = 595.0
    
    
    Player.all.each do |p|
      p.rank = (p.fg_percentage - fg_percentage_avg)/fg_percentage_std +
               (p.ft_percentage - ft_percentage_avg)/ft_percentage_std +
               (p.three_pts - three_pts_avg)/three_pts_std +
               (p.reb - reb_avg)/reb_std +
               (p.ast - ast_avg)/ast_std +
               (p.stl - stl_avg)/stl_std +
               (p.blk - blk_avg)/blk_std +
               (p.to - to_avg)/to_std +
               (p.pts - pts_avg)/pts_std
      p.save
    end
  end
end
    