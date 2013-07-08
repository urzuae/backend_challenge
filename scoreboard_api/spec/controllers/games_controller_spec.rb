require 'spec_helper'

describe GamesController do

  describe "#create" do
    context "when a game is created" do
      let(:player1) { FactoryGirl.create :user}
      let(:player2) { FactoryGirl.create :user, name: 'Henruz'}
      before do
        post :create, :playerA => player1.id, :playerB => player2.id
      end
      it { should respond_with(:success) }
      it { should have_rendered(format: :json) } 
    end
  end

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
      it { should have_rendered(format: :json) }

    end
  end

end
