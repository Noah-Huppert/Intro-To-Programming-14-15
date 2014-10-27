class Room
	@id = 0
	@nextTo = []
	@elements = []
	
	def initialize(id, nextTo, elements = [])
		@id = id
		@nextTo = nextTo
		@elements = elements
	end#new
	
	def validChoice(roomIndex)
		@nextTo.include? roomIndex
	end#validRoom
	
	#Getters
	def getId
		@id
	end
	
	def getNextTo
		@nextTo
	end
	
	def getElements
		@elements
	end
	
	#Setters
	def setId(id)
		@id = id
	end
	
	def setNextTo(nextTo)
		@nextTo = nextTo
	end
	
	def setElements(elements)
		@elements = elements
	end
	
	def removeElement(element)
		@elements.delete element
	end
	
	def addElement(element)
		@elements.push element
	end
end#Room