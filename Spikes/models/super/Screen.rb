class Screen
	attr_accessor :active
	
	def initialize(window)
		@window = window
		
		@active = true
	end#initialize
	
	def update
		if @active
			activeUpdate
		end
	end#update
	
	def activeUpdate
	
	end#activeUpdate
	
	def draw
		if @active
			activeDraw
		end
	end#draw
	
	def activeDraw
	
	end#activeDraw
end#Screen