require "./GameObject"

class Paddle < GameObject
	def initialize(window)
		super(window, 300, 500, 60, 60, "res/img/paddle.png")
	end#initialize
	
	def move_right
		if (@x + 5) <= (@window.width - @width / 2)
			@x += 10
		end
	end#move_right
	
	def move_left
		if (@x + 5) >= @width / 2
			@x -= 10
		end
	end
end#Paddle