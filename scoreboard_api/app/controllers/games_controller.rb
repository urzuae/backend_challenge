class GamesController < ApplicationController
  def create
    @playerA = User.find(params[:playerA])
    @playerB = User.find(params[:playerB])
    @game = Game.new
    if(@game.save!)
      @game.game_players.create!({player_id: @playerA.id})
      @game.game_players.create!({player_id: @playerB.id})
    end
    game = {:game => {
        :id => @game.id,
        :players => [
          {:id => @game.players[0].id, :points => @game.game_players[0].points},
          {:id => @game.players[1].id, :points => @game.game_players[1].points}],
        :winner => @game.winner_id}}
    render json: game
  end
  
  def score
    @game = Game.find(params[:id])
    @player = User.find(params[:player])
    @gamep = @game.game_players.find_by_player_id(@player.id)
    @gamep.update_attributes(points: @gamep.points + 1 )
    @gamep.save
    game = {:game => {
        :id => @game.id,
        :players => [
          {:id => @game.players[0].id, :points => @game.game_players[0].points},
          {:id => @game.players[1].id, :points => @game.game_players[1].points}],
        :winner => @game.winner_id}}
    render json: game
  end
  
  def reset_point
    @game = Game.find(params[:id])
    @player = User.find(params[:player])
    @gamep = @game.game_players.find_by_player_id(@player.id)
    @gamep.update_attributes(points: @gamep.points - 1 )
    @gamep.save
    game = {:game => {
        :id => @game.id,
        :players => [
          {:id => @game.players[0].id, :points => @game.game_players[0].points},
          {:id => @game.players[1].id, :points => @game.game_players[1].points}],
        :winner => @game.winner_id}}
    render json: game
  end
  
  def show
    @game = Game.find(params[:id])
    game = {:game => {
        :id => @game.id,
        :players => [
          {:id => @game.players[0].id, :points => @game.game_players[0].points},
          {:id => @game.players[1].id, :points => @game.game_players[1].points}],
        :winner => @game.winner_id}}
    render json: game
  end
  
  def end
    @game = Game.find(params[:id])
    @pointsA = @game.game_players[0].points
    @pointsB = @game.game_players[1].points
    if(@pointsA < @pointsB)
      @game.winner_id = @game.game_players[1].player_id
    else
      @game.winner_id = @game.game_players[0].player_id
    end
    @game.save
    game = {:game => {
        :id => @game.id,
        :players => [
          {:id => @game.players[0].id, :points => @game.game_players[0].points},
          {:id => @game.players[1].id, :points => @game.game_players[1].points}],
        :winner => @game.winner_id}}
    render json: game
  end
end
