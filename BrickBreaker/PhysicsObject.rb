require "./GameObject"

class PhysicsObject < GameObject
	attr_accessor :speed, :velX, :velY
	
	def initialize(window, x, y, velX, velY, width, height, image)
		super(window, x, y, width, height, image)
		@window = window
		
		@speed = 3
		@velX = velX
		@velY = velY
		
		@checkFor = []
	end#initialize
	
	def update
		@checkFor.each do |object|
			distX = @x - object.x
			distY = @y - object.y
			
			threshX = object.width / 2
			threshY = object.height / 2
			
			if distX.abs <= threshX and distY.abs <= threshY
				if distX >= 0 and @velX == 0#On the right side
					@velX = 1
				elsif distX >= 0 and @velX < 0#On the right side, going wrong direction
					@velX *= -1
				elsif distX <= 0 and @velX == 0#On the left side
					@velX = -1
				elsif distX <= 0 and @velX > 0#On the left side, going wrong direction
					@velX *= -1
				end
					
				@velY *= -1
			end
		end
		
		#Check window bounds
		if @x >= @window.width or @x <= 0
			@velX *= -1
		end
		
		if @y >= @window.height or @y <= 0
			@velY *= -1
		end
		
		@x += @speed * @velX
		@y += @speed * @velY
	end#update
	
	def checkFor(o)
		@checkFor.push o
	end#checkFor
end