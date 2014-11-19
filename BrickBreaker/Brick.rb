require "./GameObject"

class Brick < GameObject
	def initialize(window, x, y)
		super(window, x, y, 60, 20, "res/img/brick.png")
	end#initialize
	
	def onCollide(side = "")
		@window.score += 10
		@window.destroyBlock(self)
	end#onCollide
end#Brick