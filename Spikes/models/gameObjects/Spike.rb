require "./models/super/GameObject"

class Spike < GameObject
	def initialize(window, x, y, rotation)
		super(window, "spike", x, y, rotation, 20, 20, "res/spike/spike.png")
	end#initialize
	
	def onCollide(side = "", id = "")
		if id == "bird"
			@window.gameScreen.active = false
			@window.gameOverScreen.active = true
		end
	end#onCollide
end#bird