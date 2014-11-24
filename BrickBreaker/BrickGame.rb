require "gosu"
require "./Paddle"
require "./Ball"
require "./Brick"

class BrickGame < Gosu::Window
	attr_accessor :score, :lives, :noLives
	def initialize
		super(800, 600, false)
		self.caption = "Brick Game"
		
		@noLives = false
		
		puts "Debug commands:"
		puts "		Z => Disable lives removal"
		puts "		X => Enable lives removal"
		
		@paddle = Paddle.new(self)
		@ball = Ball.new(self)
		@ball.startY
		
		@score = 0
		@lives = 3
		
		@font = Gosu::Font.new(self, "System", 36)		
		@bricks = []
				
		@ball.checkFor(@paddle)
		
		addBricks 4
		
		@updateCycle = 0
		@updateCycleWhen = 1
	end#initialize
	
	def draw
		if @lives > 0 and @bricks.length > 0
			@paddle.draw
			@ball.draw
		
			@bricks.each do |brick|
				brick.draw
			end
		
			@font.draw("Lives: #@lives", 20, self.height - 40, 0)
			@font.draw("Score: #@score", self.width - 170, self.height - 40, 0)
		else
			@font.draw("Game Over, Score: #{@score}", (self.width / 2) - 170, self.height / 2, 0)
		end
	end#draw
	
	def update
		if @lives > 0 and @bricks.length > 0
			if button_down?(Gosu::KbRight)
				@paddle.move_right
			end
		
			if button_down?(Gosu::KbLeft)
				@paddle.move_left
			end
			
			if button_down?(Gosu::KbEscape)
				close
			end
			
			if button_down?(Gosu::KbZ)
				@noLives = true
				puts "No Lives: #{@noLives}"
			end
						
			if button_down?(Gosu::KbX)
				@noLives = false
				puts "No Lives: #{@noLives}"
			end
			
			if @updateCycle >= @updateCycleWhen
				@updateCycle = 0
				@bricks.each do |brick|
					brick.update
				end
						
				@ball.update
			end
			
			@updateCycle += 1
		end
	end#update
	
	def addBricks(rows)
		tempBricksY = 20
				
		while tempBricksY <= rows * 30
			tempBricksX = 40
			while tempBricksX <= self.width
				brick = Brick.new(self, tempBricksX, tempBricksY)
					
				brick.startY
						
				@bricks.push brick
					
				@ball.checkFor brick
					
				tempBricksX += 80
			end
			tempBricksY += 30
		end
	end#addBlocks
	
	def destroyBlock(block)
		@bricks.delete(block)
		@ball.stopCheckingFor(block)
	end#destroyBlock
end#BrickGame

window = BrickGame.new
window.show