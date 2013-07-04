require 'spec_helper'

describe GamesController do

  describe "#show" do
    context "getting information of a game" do
      before do
        @game = Factory(:game, :winner_id => 1)
        get :show, :id => @game
      end    

      it { should respond_with(:success) }

    end
  end

end
