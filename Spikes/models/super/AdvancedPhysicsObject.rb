require "./models/super/PhysicsObject"

class AdvancedPhysicsObject < PhysicsObject
	def initialize(window, id, x, y, rotation, width, height, vertexMap, image)
		super(window, id, x, y, rotation, width, height, image)
		
		@vertexMap = vertexMap
	end#initialize
	
	def update
		@checkFor.each do |object|
		
		end
	
		checkForWindowBounds
		applyGravity
	end#update
end#AdvancedPhysicsObject