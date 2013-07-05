require 'spec_helper'

describe GamesController do

  describe "#show" do
    context "when a game is found" do
      let(:playerA) { FactoryGirl.create :user }
      let(:playerB) { FactoryGirl.create :user, name: 'Henruz' }
      let(:game)    { FactoryGirl.create :game }

      before do
        game.game_players.create!({player_id: playerA.id})
        game.game_players.create!({player_id: playerB.id})
        get :show, :id => game.id
      end

      it { should respond_with(:success) }

    end
  end

end
