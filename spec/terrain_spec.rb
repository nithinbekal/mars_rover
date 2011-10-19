
require 'spec_helper'

include MarsRover

describe Terrain do

  context "#initialize" do
    
    it "should initialize with correct values" do
      t = Terrain.new(5,8)
      t.x_limit.should == 5
      t.y_limit.should == 8
    end
    
  end
  
  context "#is_edge_for?" do
  
    before do
      @t = Terrain.new(5,8)    
    end
  
    it "should identify North edge" do
      @t.is_edge_for?("N", Location.new(3,8)).should be_true
      @t.is_edge_for?("N", Location.new(5,7)).should be_false
    end
  
    it "should identify East edge" do
      @t.is_edge_for?("E", Location.new(5,4)).should be_true
      @t.is_edge_for?("E", Location.new(4,7)).should be_false
    end
  
    it "should identify South edge" do
      @t.is_edge_for?("S", Location.new(3,0)).should be_true
      @t.is_edge_for?("S", Location.new(3,4)).should be_false
    end
  
    it "should identify West edge" do
      @t.is_edge_for?("W", Location.new(0,6)).should be_true
      @t.is_edge_for?("W", Location.new(2,6)).should be_false
    end
  
  end
  
end

