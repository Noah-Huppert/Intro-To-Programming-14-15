require "./models/super/PhysicsObject"

class Bird < PhysicsObject
	def initialize(window)
		super(window, "bird", window.width / 2, window.height / 2, 0, 20, 20, "res/bird/bird.png")
	end#initialize
	
	def onCollide(side = "", id = "")
		if side == "window_left"
			@window.gameScreen.hitSide "left"
		elsif side == "window_right"
			@window.gameScreen.hitSide "right"
		end
	end#onCollide
end#bird