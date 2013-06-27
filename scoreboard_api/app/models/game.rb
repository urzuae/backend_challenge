class Game < ActiveRecord::Base
  attr_accessible :winner_id
  
  belongs_to :winner, class_name: "User"
  has_many :game_players
  has_many :players, through: :game_players
  
end
