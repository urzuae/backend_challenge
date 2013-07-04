require 'spec_helper'

describe GamePlayer do
  
  describe "relationships" do
    it { should belong_to(:game) }
    it { should belong_to(:player) }
  end

  describe "accesible attributes" do
    it { should allow_mass_assignment_of(:player_id) }
    it { should allow_mass_assignment_of(:game_id) }
    it { should allow_mass_assignment_of(:points) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:player_id) }
    it { should validate_presence_of(:game_id) }
    it { should validate_numericality_of(:points) }
    it { should allow_value(0).for(:points) }
    it { should_not allow_value(-5).for(:points) }
  end
end
