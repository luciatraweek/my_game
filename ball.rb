class Ball
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/shark.png", true)
    @speed = rand(17) + 1
    reset!
  end
  
  def update
    if @y > @game_window.height
      reset!
    else
      @y = @y + @speed
    end
  end
  
  def draw
    @icon.draw(@x,@y,2)
  end
  def x
    @x
  end
  def y
    @y
  end
  
  def reset!
    @y = 0
    @x = rand(@game_window.width)
  end
  
end
