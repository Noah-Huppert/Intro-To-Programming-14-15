require "./models/super/Screen"

class GameStartScreen < Screen
	def initialize(window)
		super(window)
		
		@font = Gosu::Font.new(@window, "System", 36)
	end#initialize
	
	def activeUpdate
		if @window.button_down?(Gosu::KbSpace)
			@window.screenManager.activate "gameScreen"
		end
	end#activeUpdate
	
	def activeDraw
		@font.draw("Press Space To Start", (@window.width / 2) - 150, @window.height / 2, 0, 1, 1, 0xff000000)
	end#activeDraw
	
end#GameOverScreen