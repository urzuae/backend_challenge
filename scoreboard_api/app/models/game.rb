class Game < ActiveRecord::Base
  attr_accessible :winner
  
  has_many :game_players, dependent: :destroy
  has_many :players, through: :game_players, source: :player
  has_one :winner, class_name: "User"
  
end
