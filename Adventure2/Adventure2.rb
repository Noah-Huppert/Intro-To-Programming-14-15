require "./Room.rb"
require "./Player.rb"

=begin
Rooms
	1	2	3
	4	5
		6	7
		8	9
=end

@rooms = {
	1 => Room.new(1, [4, 2]),
	2 => Room.new(2, [1, 3, 5]),
	3 => Room.new(3, [2]),
	4 => Room.new(4, [1, 5]),
	5 => Room.new(5, [4, 2, 6]),
	6 => Room.new(6, [5, 7, 8]),
	7 => Room.new(7, [6, 9]),
	8 => Room.new(8, [6, 9]),
	9 => Room.new(9, [7, 8])
}

@beingPlayed = true
@currentRoom = 1
@player = Player.new 

def betterRand(notToBe = [], max = 9, offset = 1)
	random = rand(max) + offset
	
	while notToBe.include? random
		random = rand(max) + offset
	end
	
	random
end

#Randomly add items
keyRoom = betterRand [1]
mapRoom = betterRand [1, keyRoom]
exitRoom = betterRand [1, keyRoom, mapRoom, 2, 3, 4, 5]

@rooms[keyRoom].addElement "key"
@rooms[mapRoom].addElement "map"
@rooms[exitRoom].addElement "exit"

#Add misc items
toBeFilled = [1, 2, 3, 4, 5, 6, 7, 8, 9]
toBeFilled.delete(keyRoom)
toBeFilled.delete(mapRoom)
toBeFilled.delete(exitRoom)

fillerItems = ["talkingHead", "dusty", "swamp", "discoBall", "talkingHorse", "genie"]

toBeFilled.each { |toBe|
	itemIndex = betterRand [], fillerItems.length, 0
	
	@rooms[toBe].addElement fillerItems[itemIndex]
	fillerItems.delete_at itemIndex
}

def printMap
	puts "********** Map **********"
	
	roomPrints = {}
	
	i = 1
	
	@rooms.each { |room |
		
		if i == @currentRoom
			roomPrints[i] = "[ #{i} ]"
		else 
			roomPrints[i] = "  #{i}  "
		end
		
		i += 1
	}

	puts "#{roomPrints[1]} -- #{roomPrints[2]} -- #{roomPrints[3]}"
	puts "  |        |"
	puts "#{roomPrints[4]} -- #{roomPrints[5]}"
	puts "           |"
	puts "         #{roomPrints[6]} -- #{roomPrints[7]}"
	puts "           |        |"
	puts "         #{roomPrints[8]} -- #{roomPrints[9]}"
	puts "*************************"
end#printMap

def prettyPrintArray(array, pre = "")
	prompt = pre
	
	i = 1
	
	array.each { |item| 
			delimeter = ", "
			
			if i == array.length#Last item
				delimeter = ""
			elsif i == array.length - 1#Second to last item
				delimeter = " and "
			end
			
			prompt += item.to_s + delimeter
			i += 1
	}
	
	puts prompt
end

while @beingPlayed 
	prettyPrintArray @rooms[@currentRoom].getNextTo, "You are in room #{@currentRoom}, you can go to rooms "
	
	@rooms[@currentRoom].getElements.each { |element|
		if element == "key"
			@player.addItem "key"
			@rooms[@currentRoom].removeElement "key"
			puts "You find a key!"
		elsif element == "map"
			@player.addItem "map"
			@rooms[@currentRoom].removeElement "map"
			puts "You find a map!"
		elsif element == "exit"
			if @player.hasItem "key"
				puts "Congratulations, you found the exit!\n********** Game Over **********\nYou win"
				@beingPlayed = false
				exit
			else
				puts "You find the exit, however the door is locked. You need a key"
			end
		elsif element == "talkingHead"
			puts "You see a head, and it wants to talk to you. But you remeber what your mother said about strangers and move on"
		elsif element == "dusty"
			puts "You enter a dusty room, nothing apears to be in it"
		elsif element == "swamp"
			puts "You step into a swamp, it ruins your shoes, but seeing as you are stuck in a maze this is the least of your worries"
		elsif element == "discoBall"
			puts "You see a light switch and flip it. A disco ball lowers down from the ceiling and some funky music starts playing"
		elsif element == "talkingHorse"
			if @player.hasItem "key"
				puts "The horse sees that you have a key and asumes you know there is a matching door"
			else
				puts "You find a horse and it tells you that you need a key to open the exit door"
			end
		elsif element == "genie"
			if @player.hasItem "key"
				puts "You see a genie. He sees that you have a key and tells you that the exit is in room #{exitRoom}"
			else
				puts "You see a genie. He does not want to talk to you"
			end
		end
	}
	
	#After going to exit the game might still be going
	if !@player.getItems.nil? and @player.getItems.length > 0
		prettyPrintArray @player.getItems, "You have the items: "
	end
	
	if @player.hasItem "map"
		printMap
	end
		
	choice = gets.chomp.to_i
	
	if !@rooms[choice].nil? and @rooms[@currentRoom].validChoice choice
		@currentRoom = choice
	else
		puts "You must enter a valid room"
	end
end