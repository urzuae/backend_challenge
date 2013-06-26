class User < ActiveRecord::Base
  attr_accessible :name
  
  has_many :game_players, foreign_key: "player", dependet: :destroy
  belongs_to :game
  
  validates :name, presence: true
end
