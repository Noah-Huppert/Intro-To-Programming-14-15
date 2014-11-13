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
end#GameObject