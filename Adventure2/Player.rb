class Player
	@items = []
	@health = 5
	
	def initialize
		@items = []
		@health = 5
	end
	
	#Actions
	def hasItem(item)
		@items.include? item
	end#hasItem
	
	#Getters
	def getItems
		@items
	end#getItems
	
	def getHealth
		@health
	end#getHealth
	
	#Setters
	def setItems(items)
		@items = items
	end#setItems
	
	def addItem(item)
		@items.push item
	end#addItem
	
	def removeItem(item)
		@items.unshift item
	end#removeItem
	
	def setHealth(health)
		@health = health
	end
	
	def modHealth(mod)
		if @heath + mod >= 0
			@heath += mod
		end
	end#modHealth
end#Player