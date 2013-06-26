class GamePlayers < ActiveRecord::Base
  attr_accessible :game_id, :player, :points
  
  belongs_to :game
  belongs_to :player, class_name: "User"
  
  validates :game_id, presence: true
  validates :player, presence: true
end
