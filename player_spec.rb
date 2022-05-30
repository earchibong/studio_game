require_relative 'player'
require_relative 'spec_helper'

describe Player do
  before do
    @initial_health = 150
    @player = Player.new('larry', @initial_health)
    $stdout = StringIO.new
  end
  
  it "has a capitalized name" do
    #expect(player.name).to eq('Larry')
    @player.name.should == 'Larry'
  end
  
  it "has an initial health" do
    @player.health.should == 150
  end
  
  it "has a string representation" do
    @player.to_s.should == "I'm Larry with a health of 150 and score of 155"
  end
  
  
  it "computes a score as the sum of its health and length of its name" do
    @player.score.should == 155
  end
  
  
  it "increases health by 15 when w00ted" do
    @player.w00t
    @player.health.should == @initial_health + 15
  end
  
  
  it "decreases health by 10 when blammed" do
    @player.blam
    @player.health.should == @initial_health - 10
  end
  
  context "it has a health greater than 100" do
    before do
      @player = Player.new('ABC', 150)
    end
    
    it "is strong" do
      @player.should be_strong
    end
  end
  
  context "it has a health less than or equal 100" do
    before do
      @player = Player.new('ABC', 100)
    end
    
    it "is wimpy" do
      @player.should_not be_strong
    end
  end
end
