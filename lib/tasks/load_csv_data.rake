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
  
  desc "load daily team standing"
  task :load_csv_daily_standing => :environment do
    require 'fastercsv'
    
    FasterCSV.foreach("daily_standing.csv") do |row|
      DailyStanding.create(
        :rk => row[0], 
        :team => row[1], 
        :fg => row[3], 
        :ft => row[4], 
        :three_pm => row[5],
        :reb => row[6], 
        :ast => row[7], 
        :stl => row[8], 
        :blk => row[9], 
        :to => row[10], 
        :pts => row[11],
        :gp => row[13],
        :move => row[14]
      )
    end
    
    DailyStanding.all.each do |ds|
      ds.three_pm = ds.three_pm / ds.gp
      ds.reb = ds.reb / ds.gp
      ds.ast = ds.ast / ds.gp
      ds.stl = ds.stl / ds.gp
      ds.blk = ds.blk / ds.gp
      ds.to = ds.to / ds.gp
      ds.pts = ds.pts / ds.gp
      ds.save
    end
  end
  
  
  desc "assign ranking for each player"
  task :assign_ranking => :environment do
    fg_percentage_avg = 0.4452
    fg_percentage_std = 0.0301
    ft_percentage_avg = 0.7499
    ft_percentage_std = 0.0535
    three_pts_avg = 0.8
    three_pts_std = 0.3
    reb_avg = 5.61
    reb_std = 0.41
    ast_avg = 3.11
    ast_std = 0.63
    stl_avg = 1.03
    stl_std = 0.13
    blk_avg = 0.71
    blk_std = 0.22
    to_avg = 2.18
    to_std = 0.36
    pts_avg = 14.58
    pts_std = 2.25
    
    
    Player.all.each do |p|
      p.rank = (p.fg_percentage - fg_percentage_avg)/fg_percentage_std +
               (p.ft_percentage - ft_percentage_avg)/ft_percentage_std +
               (p.three_pts/66 - three_pts_avg)/three_pts_std +
               (p.reb/66 - reb_avg)/reb_std +
               (p.ast/66 - ast_avg)/ast_std +
               (p.stl/66 - stl_avg)/stl_std +
               (p.blk/66 - blk_avg)/blk_std -
               (p.to/66 - to_avg)/to_std +
               (p.pts/66 - pts_avg)/pts_std
      p.save
    end
  end
end
    