require "./models/PhysicsObject.rb"

class Bird < PhysicsObject
	def initialize(window)
		super(window, "bird", window.width / 2, window.height / 2, 20, 20, "res/bird/bird.png")
	end#initialize
	
	def onCollide(side = "", id = "")
		if side == "window_bottom" or side == "window_top"
			@window.setGameScreenActive false
		end
	end#onCollide
end#bird