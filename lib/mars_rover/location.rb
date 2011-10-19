
module MarsRover
  
  class Location

    attr_accessor :x, :y

    def initialize(x=0, y=0)
      @x, @y = x.to_i, y.to_i
    end
   
    def step(dir)
      @y += 1 if dir == 'N'
      @x += 1 if dir == 'E'
      @y -= 1 if dir == 'S'
      @x -= 1 if dir == 'W'
    end
   
  end

end

