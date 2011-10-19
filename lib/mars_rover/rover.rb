
module MarsRover

  class Rover

    TURNS = {
      "L" => { "N" => "W", "W" => "S", "S" => "E", "E" => "N" },
      "R" => { "N" => "E", "W" => "N", "S" => "W", "E" => "S" }
    }
   
    attr_accessor :location, :direction, :terrain
   
    def initialize(position, terrain)
      x, y, @direction = *(position.split)
      @location = Location.new(x, y)
      @terrain = terrain
    end
    
    def to_s
      "#{@location.x} #{@location.y} #{@direction}"
    end

    def turn(side)
      @direction = TURNS[side][@direction]
    end

    def execute(instruction)
      return turn(instruction) if ['L', 'R'].include?(instruction)
      return if @terrain.is_edge_for?(direction, @location)
      @location.step(@direction)
    end
       
    def move(steps)
      steps.split(//).each { |step| execute(step) }
    end
   
  end

end

