require "./models/super/Screen"
require "./models/screens/GameScreen"

class GameOverScreen < Screen
	def initialize(window)
		super(window)
		
		@font = Gosu::Font.new(@window, "System", 36)
	end#initialize
	
	def activeUpdate
		if @window.button_down?(Gosu::KbSpace)
			@window.screenManager.setScreen "gameScreen", GameScreen.new(@window)
			@window.screenManager.activate "gameScreen"
		end
	end#activeUpdate
	
	def activeDraw
		@font.draw("Game Over", (@window.width / 2) - 90, (@window.height / 2) - 100, 0, 1, 1, 0xff000000)
		@font.draw("Score: #{@window.screenManager.getScreen('gameScreen').score}", (@window.width / 2) - 65, (@window.height / 2) - 60, 0, 1, 1, 0xff000000)
		
		@font.draw("Press Space to Replay", (@window.width / 2) - 160, (@window.height / 2) + 50, 0, 1, 1, 0xff000000)
	end#activeDraw
	
end#GameOverScreen