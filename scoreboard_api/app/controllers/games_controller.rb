class GamesController < ApplicationController
  before_filter :check_players, :only => :create
  before_filter :find_game, :except => :create
  before_filter :find_player, :only => [:score, :reset_point]
  before_filter :check_score, :only => [:reset_point]
  before_filter :check_ended_game, :only => [:end, :score, :reset_point]
  
  def create
    @game = Game.new
    if(@game.save!)
      @game.game_players.create!({player_id: @playerA.id})
      @game.game_players.create!({player_id: @playerB.id})
    end
    render json: @game.render_game
  end
  
  def score
    @gamep = @game.game_players.find_by_player_id(@player.id)
    @gamep.update_attribute(:points, @gamep.points + 1 )
    @gamep.save
    render json: @game.render_game
  end
  
  def reset_point
    @gamep = @game.game_players.find_by_player_id(@player.id)
    @gamep.update_attribute(:points, @gamep.points - 1)
    render json: @game.render_game
  end
  
  def show
    render json: @game.render_game
  end
  
  def end
    @pointsA = @game.game_players.first.points
    @pointsB = @game.game_players.last.points
    @playerA = @game.game_players.first.player
    @playerB = @game.game_players.last.player
    if(@pointsA < @pointsB)
      @game.set_winner(@playerA.id)
      @playerA.win
      @playerB.lose
    else
      @game.set_winner(@playerB.id)
      @playerB.win
      @playerA.lose
    end
    render json: @game.render_game
  end
  
  private
  
  def check_ended_game
    if(@game.winner_id)
      render json: @game.render_game, status: :not_modified
    end
  end
  
  def find_game
    @game = Game.find(params[:id])
  end
  
  def find_player
    @player = User.find(params[:player])
  end
  
  def check_players
    @playerA = User.find(params[:playerA])
    @playerB = User.find(params[:playerB])
    if(@playerA.id == @playerB.id)
      render :nothing => true, status: :no_content
    end
  end
  
  def check_score
    @gamep = @game.game_players.find_by_player_id(@player.id)
    if(@gamep.points <= 0)
      render json: @game.render_game, status: :not_modified
    end
  end
end
