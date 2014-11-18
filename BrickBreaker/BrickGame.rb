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
		
		@bricks = []
		tempBricksX = 0
		
		while tempBricksX <= self.width
			brick = Brick.new(self, tempBricksX, 100)
			@bricks.push brick
			
			@ball.checkFor brick
			
			tempBricksX += 80
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