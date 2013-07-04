class GamePlayer < ActiveRecord::Base
  attr_accessible :game_id, :player_id, :points
  validates_numericality_of :points, greater_than_or_equal_to: 0
  
  belongs_to :game, class_name: "Game"
  belongs_to :player, class_name: "User"
  
  validates :game_id, presence: true
  validates :player_id, presence: true
  
end
