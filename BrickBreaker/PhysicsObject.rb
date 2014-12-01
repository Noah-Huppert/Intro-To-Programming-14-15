require "./GameObject"

class PhysicsObject < GameObject
	attr_accessor :speed, :gravity, :velX, :velY, :defVelX, :defVelY
	
	def initialize(window, x, y, defVelX, defVelY, width, height, image)
		super(window, x, y, width, height, image)
		@window = window
		
		@speed = 3
		
		@gravity = 0.2
		
		@defVelX = defVelX
		@defVelY = defVelY
		
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
					@velX = @defVelX
				elsif distX >= 0 and @velX < 0#On the right side, going wrong direction
					object.onCollide "object_right", @id
					@velX *= -1
				elsif distX <= 0 and @velX == 0#On the left side
					object.onCollide "object_left", @id
					@velX = -1 * @defVelX
				elsif distX <= 0 and @velX > 0#On the left side, going wrong direction
					object.onCollide "object_left", @id
					@velX *= -1
				else
					object.onCollide "object_center", @id
				end
					
				@velY *= -1
			end
		end
		
		#Check window bounds
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
		
		#Gravity
		if @velY < @speed
			@velY += @gravity
		end
		
		@x += @speed * @velX
		@y += @speed * @velY
	end#update
	
	def checkFor(o)
		@checkFor.push o
	end#checkFor
	
	def stopCheckingFor(o)
		@checkFor.delete o
	end#stopCheckingFor
	
	def startX
		@velX = @defVelX
	end#startX
	
	def startY
		@velY = @defVelY
	end#startY
end