require 'rubygems'
require 'gosu'
require 'player'
require 'ball'

class MyGame < Gosu::Window
  def initialize
    super(600, 600, false)
    @player1 = Player.new(self)
    @balls = 4.times.map {Ball.new(self)}
    @running = true
    @counter = 0
    @lives = 3
    @background= Gosu::Image.new(self,"images/dungeon.png", true)
    @score = 0
    @font = Gosu::Font.new(self, Gosu::default_font_name, 30)
  end
  
  def update
    if @running
      @score = @score + 1
      if button_down? Gosu::Button::KbLeft
        @player1.move_left
      end
    
      if button_down? Gosu::Button::KbRight
        @player1.move_right
      end
    
      if button_down? Gosu::Button::KbUp
        @player1.move_up
      end
    
      if button_down? Gosu::Button::KbDown
        @player1.move_down
      end
    
      @balls.each {|ball| ball.update}
    
      if @player1.hit_by? @balls
        if @counter == @lives
          stop_game!
        else 
          @counter = @counter + 1
          restart_game
        
        end    
      end
      
    else
      if button_down? Gosu::Button::KbEscape
        @counter = 0
        restart_game
      end
    end
  end
  
  def draw
    @font.draw("The score is #{@score}", 20,20,5)
    @background.draw(0,0,1)
    @player1.draw
    @balls.each {|ball| ball.draw}
  end
  def stop_game!
    @running = false
  end
  
  def restart_game
    @running = true
    @balls.each {|ball| ball.reset!}
    
  end
end

game = MyGame.new
game.show

