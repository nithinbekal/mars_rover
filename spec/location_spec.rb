
require 'spec_helper'

include MarsRover

describe Location do

  context "#initialize" do
    
    it "should initialize correct values" do
      loc = Location.new(4,5)
      loc.x.should == 4
      loc.y.should == 5
    end
    
    it "should initialize (0,0) when not given (x,y)" do
      loc = Location.new
      loc.x.should == 0
      loc.y.should == 0
    end 
    
  end
  
  context "#step" do
      
    before do
      @loc = Location.new(3,4)
    end
      
    it "should be able to move North one step" do
      @loc.step("N")
      @loc.x.should == 3
      @loc.y.should == 5
    end
    
    it "should be able to move East one step" do
      @loc.step("E")
      @loc.x.should == 4
      @loc.y.should == 4
    end
    
    it "should be able to move South one step" do
      @loc.step("S")
      @loc.x.should == 3
      @loc.y.should == 3
    end
    
    it "should be able to move West one step" do
      @loc.step("W")
      @loc.x.should == 2
      @loc.y.should == 4
    end
    
  end

end
