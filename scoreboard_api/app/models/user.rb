class User < ActiveRecord::Base
  default_scope order('wins_count - loses_count desc')
  
  attr_accessible :name
  
  has_many :game_players, foreign_key: :player_id, dependent: :destroy
  has_many :games_won, foreign_key: "winner", dependent: :destroy, class_name: "Game"
  
  validates :name, presence: true
  
  def win
    self.update_attribute(:wins_count, self.wins_count + 1)
  end
  
  def lose
    self.update_attribute(:loses_count, self.loses_count + 1)
  end
  
end
