
require 'spec_helper'

include MarsRover

describe Rover do
  
  context "#initialize" do
    
    before do
      @t = Terrain.new(5,5)
      @r = Rover.new("1 3 N", @t)
    end
    
    it "should have correct location" do
      @r.location.x.should == 1
      @r.location.y.should == 3
    end
    
    it "should have correct direction" do
      @r.direction.should == "N"
    end
    
    it "should be in correct terrain" do
      @r.terrain.should == @t
    end
    
  end
  
  context "#to_s" do
  
    it "should return a string reprentation" do
      @r = Rover.new("1 3 N", Terrain.new(5,5))
      @r.to_s.should == "1 3 N"
    end
  
  end
  
  context "#turn" do
    
    context "when facing North" do
    
      before do
        @t = Terrain.new(5,5)
        @r = Rover.new("1 3 N", @t)
      end
      
      it "should turn left correctly" do
        @r.turn("L")
        @r.direction.should == "W"
      end

      it "should turn right correctly" do
        @r.turn("R")
        @r.direction.should == "E"
      end
      
    end    

    context "when facing East" do
    
      before do
        @t = Terrain.new(5,5)
        @r = Rover.new("1 3 E", @t)
      end
      
      it "should turn left correctly" do
        @r.turn("L")
        @r.direction.should == "N"
      end

      it "should turn right correctly" do
        @r.turn("R")
        @r.direction.should == "S"
      end
      
    end    

    context "when facing South" do
    
      before do
        @t = Terrain.new(5,5)
        @r = Rover.new("1 3 S", @t)
      end
      
      it "should turn left correctly" do
        @r.turn("L")
        @r.direction.should == "E"
      end

      it "should turn right correctly" do
        @r.turn("R")
        @r.direction.should == "W"
      end
      
    end    

    context "when facing West" do
    
      before do
        @t = Terrain.new(5,5)
        @r = Rover.new("1 3 W", @t)
      end
      
      it "should turn left correctly" do
        @r.turn("L")
        @r.direction.should == "S"
      end

      it "should turn right correctly" do
        @r.turn("R")
        @r.direction.should == "N"
      end
      
    end    

  end
  
  context "#execute" do
  
    context "when standing on the edge of the terrain" do
    
      before do
        @t = Terrain.new(5,5)
        @r = Rover.new("2 5 N", @t)
      end
      
      it "should not be able to move forward" do
        @r.execute("M")
        @r.location.x.should == 2
        @r.location.y.should == 5
      end
      
      it "should turn correctly" do
        @r.execute("L")
        @r.direction.should == "W"
      end
    
    end
    
    context "when there is space to move" do
      
      before do
        @t = Terrain.new(5,5)
        @r = Rover.new("2 3 W", @t)
      end
      
      it "should be able to move forward one step" do
        @r.execute("M")
        @r.location.x.should == 1
        @r.location.y.should == 3
      end
      
      it "should turn correctly" do
        @r.execute("L")
        @r.direction.should == "S"
      end
      
    end
    
  end
  
  context "#move" do
  
    it "should reach correct position" do
      t = Terrain.new(10, 10)
      r = Rover.new("4 4 N", t)
      r.move("MMLMMRMLM")
      
      r.direction.should == "W"
      r.location.x.should == 1
      r.location.y.should == 7
    end
  
  end
end

