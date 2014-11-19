require "gosu"
require "./Paddle"
require "./Ball"
require "./Brick"

class BrickGame < Gosu::Window
	attr_accessor :score, :lives
	def initialize
		super(800, 600, false)
		self.caption = "Brick Game"
		
		@paddle = Paddle.new(self)
		@ball = Ball.new(self)
		
		@score = 0
		@lives = 3
		
		@font = Gosu::Font.new(self, "System", 36)		
		@bricks = []
		tempBricksY = 20
		
		while tempBricksY <= 100
			tempBricksX = 40
			while tempBricksX <= self.width
				brick = Brick.new(self, tempBricksX, tempBricksY)
				
				@bricks.push brick
			
				@ball.checkFor brick
			
				tempBricksX += 80
			end
			tempBricksY += 30
		end
		
		@ball.checkFor(@paddle)
	end#initialize
	
	def draw
		if @lives > 0
			@paddle.draw
			@ball.draw
		
			@bricks.each do |brick|
				brick.draw
			end
		
			@font.draw("Lives: #@lives", 20, self.height - 40, 0)
			@font.draw("Score: #@score", self.width - 150, self.height - 40, 0)
		else
			@font.draw("Game Over, Score: #{@score}", (self.width / 2) - 170, self.height / 2, 0)
		end
	end#draw
	
	def update
		if @lives > 0
			if button_down?(Gosu::KbRight)
				@paddle.move_right
			end
		
			if button_down?(Gosu::KbLeft)
				@paddle.move_left
			end
		
			@ball.update
		end
	end#update
	
	def destroyBlock(block)
		@bricks.delete(block)
		@ball.stopCheckingFor(block)
	end#destroyBlock
end#BrickGame

window = BrickGame.new
window.show