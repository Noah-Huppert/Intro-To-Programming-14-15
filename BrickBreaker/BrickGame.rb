require "gosu"
require "./Paddle"
require "./Ball"
require "./Brick"

class BrickGame < Gosu::Window
	def initialize
		super(800, 600, false)
		self.caption = "Brick Game"
		
		@paddle = Paddle.new(self)
		@ball = Ball.new(self)
		
		@bricks = [Brick.new(self, 0, 100)]
		
		while @bricks[@bricks.length - 1].x <= self.width
			@bricks.push Brick.new self, [@bricks.length - 1].x + 100, 100
		end
		
		@ball.checkFor(@paddle)
	end#initialize
	
	def draw
		@paddle.draw
		@ball.draw
		
		@bricks.each do |brick|
			brick.draw
		end
	end#draw
	
	def update
		if button_down?(Gosu::KbRight)
			@paddle.move_right
		end
		
		if button_down?(Gosu::KbLeft)
			@paddle.move_left
		end
		
		@ball.update
	end#update
end#BrickGame

window = BrickGame.new
window.show