class GamePlayer < ActiveRecord::Base
  attr_accessible :game_id, :player_id, :points
  
  belongs_to :game, class_name: "Game"
  belongs_to :player, class_name: "User"
  
  validates :game_id, presence: true
  validates :player_id, presence: true
  
  def find_by_player(player, game)
    
  end
end