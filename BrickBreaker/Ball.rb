require "./PhysicsObject"

class Ball < PhysicsObject
	def initialize(window)
		super(window, 300, 300, 0, 1, 20, 20, "res/img/ball.png")
	end#initialize
	
	def onCollide(directions = "")
		if directions.include? "window_bottom"
			@window.lives -= 1
		end
	end#onCollide
end#Ball