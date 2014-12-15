require "./models/super/Screen"

class GameOverScreen < Screen
	def initialize(window)
		super(window)
		
		@font = Gosu::Font.new(@window, "System", 36)
	end#initialize
	
	def activeDraw
		@font.draw("Game Over", (@window.width / 2) - 90, @window.height / 2, 0, 1, 1, 0xff000000)
		@font.draw("Score: #{@window.screenManager.getScreen('gameScreen').score}", (@window.width / 2) - 65, (@window.height / 2) + 40, 0, 1, 1, 0xff000000)
	end#activeDraw
	
end#GameOverScreen