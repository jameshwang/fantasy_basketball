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
                  
  
end