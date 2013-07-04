require 'spec_helper'

describe Game do
  
  describe "relationships" do
    it { should have_many(:game_players) }
    it { should have_many(:players).through(:game_players) }
    it { should belong_to(:winner) }
  end
  
  describe "protected attributes" do
    it { should_not allow_mass_assignment_of(:winner_id)}
  end
  
end
