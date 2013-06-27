class User < ActiveRecord::Base
  attr_accessible :name
  
  has_many :game_players, foreign_key: :player, dependent: :destroy
  has_many :games_won, foreign_key: "winner", dependent: :destroy, class_name: "Game"
  
  validates :name, presence: true
end
