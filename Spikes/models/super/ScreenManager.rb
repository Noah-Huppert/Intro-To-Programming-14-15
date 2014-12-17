class ScreenManager
	def initialize(window)
		@window = window
		@screens = {}
	end#initialize 
	
	def update
		@screens.each do |name, screen|
			screen.update
		end
	end#update
	
	def draw
		@screens.each do |name, screen|
			screen.draw
		end
	end#draw
	
	def getScreen(name)
		return @screens[name]
	end
	
	def addScreen(name, screen)
		if @screens[name].nil?
			@screens[name] = screen
		end
	end#addScreen
	
	def setScreen(name, screen)
		@screens[name] = screen
	end#setScreen
	
	def removeScreen(name)
		@screens.delete name
	end#removeScreen
	
	def activate(name)
		@screens.each do |name, screen|
			screen.active = false
		end
		
		@screens[name].active = true
	end
end#ScreenManager