require "./models/super/GameObject"

class PhysicsObject < GameObject
	attr_accessor :speed, :gravity, :velX, :velY
	
	def initialize(window, id, x, y, rotation, width, height, image)
		super(window, id, x, y, rotation, width, height, image)
		@window = window
		
		@speed = 2
		@maxSpeed = 6
		
		@gravity = 0.2
		
		@velX = 0
		@velY = 0
		
		@checkFor = []
	end#initialize
	
	def update
		@checkFor.each do |object|
			distX = @x - object.x
			distY = @y - object.y
			
			threshX = object.width / 2 + @width / 2
			threshY = object.height / 2 + @height / 2
			
			if distX.abs <= threshX and distY.abs <= threshY
				if distX >= 0 and @velX == 0#On the right side
					object.onCollide "object_right", @id
					@velX = @speed
				elsif distX >= 0 and @velX < 0#On the right side, going wrong direction
					object.onCollide "object_right", @id
					@velX *= -1
				elsif distX <= 0 and @velX == 0#On the left side
					object.onCollide "object_left", @id
					@velX = -1 * @speed
				elsif distX <= 0 and @velX > 0#On the left side, going wrong direction
					object.onCollide "object_left", @id
					@velX *= -1
				else
					object.onCollide "object_center", @id
				end
					
				@velY *= -1
			end
		end
		
		checkForWindowBounds
		applyGravity
		
	end#update
	
	def checkForWindowBounds
		if @x >= @window.width - (@width / 2)
			onCollide "window_right"
			@velX *= -1
		elsif @x <= @width / 2
			onCollide "window_left"
			@velX *= -1
		end
			
		if @y >= @window.height - (@height / 2)
			onCollide "window_bottom"
			@velY *= -1
		elsif @y <= @height / 2
			onCollide "window_top"
			@velY *= -1
		end
	end#checkForWindowBounds
	
	def applyGravity
		if @velY < @maxSpeed
			@velY += @gravity
		end
		
		@x += @speed * @velX
		@y += @speed * @velY
	end#applyGravity
	
	def checkFor(o)
		@checkFor.push o
	end#checkFor
	
	def stopCheckingFor(o)
		@checkFor.delete o
	end#stopCheckingFor
	
	def startX
		@velX = @speed
	end#startX
	
	def startY
		@velY = @speed
	end#startY
end