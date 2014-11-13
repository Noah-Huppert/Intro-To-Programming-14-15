require "./PhysicsObject"

class Ball < PhysicsObject
	def initialize(window)
		super(window, 300, 300, 20, 20, "res/img/ball.png")
	end#initialize
end#Ball