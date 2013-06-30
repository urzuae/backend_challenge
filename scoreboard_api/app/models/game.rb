class Game < ActiveRecord::Base
  
  belongs_to :winner, class_name: "User"
  has_many :game_players
  has_many :players, through: :game_players
  
  def render_game
    return {:game => {
        :id => self.id,
        :players => [
          {:id => self.game_players.first.player_id, :points => self.game_players.first.points},
          {:id => self.game_players.last.player_id, :points => self.game_players.last.points}],
        :winner => self.winner_id}
    }
  end
  
  def set_winner(player_id)
    self.update_attribute(:winner_id, player_id)
  end
  
end
