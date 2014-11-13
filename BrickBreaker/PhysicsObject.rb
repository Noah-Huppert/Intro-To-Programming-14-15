require "./GameObject"

class PhysicsObject < GameObject
	attr_accessor :speed, :velX, :velY
	
	def initialize(window, x, y, width, height, image)
		super(window, x, y, width, height, image)
		
		@speed = 3
		@velX = 0
		@velY = 1
		
		@checkFor = []
	end#initialize
	
	def update
		@x += @speed * @velX
		@y += @speed * @velY
		
		@checkFor.each do |object|
			if @x == object.x
							@velX = @velX * -1
						end
						
			if @y == object.y
				@velY = @velY * -1
			end
		end
	end#update
	
	def checkFor(o)
		@checkFor.push o
	end#checkFor
end