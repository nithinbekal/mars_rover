
module MarsRover

  class Terrain

    attr_accessor :x_limit, :y_limit

    def initialize(x, y)
      @x_limit, @y_limit = x, y
    end
   
    def is_edge_for?(dir, loc)
      ( ( dir == 'N' && loc.y == @y_limit ) ||
        ( dir == 'E' && loc.x == @x_limit ) ||
        ( dir == 'S' && loc.y == 0        ) ||
        ( dir == 'W' && loc.x == 0        ) )
    end

  end
  
end

