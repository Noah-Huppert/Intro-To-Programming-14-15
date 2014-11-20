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
			
			threshX = object.width / 2 + @width / 2
			threshY = object.height / 2 + @height / 2
			
			puts "#{@x} #{object.x} | #{threshX}"
			
			if distX.abs <= threshX and distY.abs <= threshY
				if distX >= 0 and @velX == 0#On the right side
					object.onCollide "object_right"
					@velX = 1
				elsif distX >= 0 and @velX < 0#On the right side, going wrong direction
					object.onCollide "object_right"
					@velX *= -1
				elsif distX <= 0 and @velX == 0#On the left side
					object.onCollide "object_left"
					@velX = -1
				elsif distX <= 0 and @velX > 0#On the left side, going wrong direction
					object.onCollide "object_left"
					@velX *= -1
				else
					object.onCollide "object_center"
				end
					
				@velY *= -1
			end
		end
		
		#Check window bounds
		if @x >= @window.width 
			onCollide "window_right"
			@velX *= -1
		elsif @x <= @width / 2
			onCollide "window_left"
			@velX *= -1
		end
		
		if @y >= @window.height 
			onCollide "window_bottom"
			@velY *= -1
		elsif @y <= @height / 2
			onCollide "window_top"
			@velY *= -1
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
end