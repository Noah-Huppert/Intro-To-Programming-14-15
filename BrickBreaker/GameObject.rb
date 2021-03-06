class GameObject
	attr_accessor :x, :y, :width, :height, :image
	
	def initialize(window, x, y, width, height, image)
		@window = window
		
		@x = x
		@y = y
		@width = width
		@height = height
		@image = Gosu::Image.new(window, image, false)
	end#initialize
	
	def draw
		@image.draw(@x - @width / 2, @y - @height / 2, 1)
	end#draw
	
	def touching(object)
		distX = @x - object.x
		distY = @y - object.y
					
		threshX = object.width / 2
		threshY = object.height / 2
					
		if distX.abs <= threshX and distY.abs <= threshY
			return true
		else
			return false
		end
	end#touching
	
	def onCollide(side = "", objectID = "")
	
	end#onCollide
	
end#GameObject