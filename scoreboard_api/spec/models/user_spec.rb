require 'spec_helper'

describe User do
  
  describe "relationships" do
    it { should have_many(:game_players) }
    it { should have_many(:games_won) }
  end
  
  describe "accesible attributes" do
    it { should allow_mass_assignment_of(:name) }
  end

  describe "protected attributes from mass assignment" do
    it { should_not allow_mass_assignment_of(:wins_count) }
    it { should_not allow_mass_assignment_of(:loses_count) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

end
