class Player < ActiveRecord::Base
  validates :player_name, :presence => true,
                          :uniqueness => { :case_sensitve => false }
  validates :owner_name, :presence => true
  validates :fg_percentage, :presence => true, :numericality => { 
                            :greater_than_or_equal_to => 0,
                            :less_than_or_equal_to => 1 }
  validates :ft_percentage, :presence => true, :numericality => {  
                            :greater_than_or_equal_to => 0,
                            :less_than_or_equal_to => 1}
  validates :three_pts, :presence => true, :numericality => { 
                        :greater_than_or_equal_to => 0}
  validates :reb, :presence => true, :numericality => { 
                  :greater_than_or_equal_to => 0}
  validates :ast, :presence => true, :numericality => { 
                  :greater_than_or_equal_to => 0}
  validates :stl, :presence => true, :numericality => { 
                  :greater_than_or_equal_to => 0}
  validates :blk, :presence => true, :numericality => { 
                  :greater_than_or_equal_to => 0}
  validates :to, :presence => true, :numericality => { 
                 :greater_than_or_equal_to => 0}
  validates :pts, :presence => 0, :numericality => { 
                  :greater_than_or_equal_to => 0}
                  
  
  # def assign_ranking
  #   # assign all the standard devs and averages here
  #   # TODO automate this later
  #   fg_percentage_avg = 
  #   fg_percentage_std =
  #   ft_percentage_avg =
  #   ft_percentage_std =
  #   three_pts_avg =
  #   three_pts_std =
  #   reb_avg =
  #   reb_std =
  #   ast_avg =
  #   ast_std =
  #   stl_avg =
  #   stl_std =
  #   blk_avg =
  #   blk_std =
  #   to_avg =
  #   to_std =
  #   pts_avg =
  #   pts_std =
  #   
  #   
  # end
end