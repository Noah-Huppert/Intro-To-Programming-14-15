require "./models/Screen"
require "./models/Bird"

class GameScreen < Screen
	def initialize(window)
		super(window)
		
		@bird = Bird.new @window
		@bird.startX
	end#initialize
	
	def activeUpdate
		@bird.update
	end#activeUpdate
	
	def activeDraw
		@bird.draw
	end#activeDraw
end#GameScreen