require "./models/super/Screen"
require "./models/gameObjects/Bird"
require "./models/gameObjects/Spike"

class GameScreen < Screen
	def initialize(window)
		super(window)
		
		@bird = Bird.new @window
		@bird.startX
		
		@score = 0
		
		@spikesLeft = []
		@spikesRight = []
		@spikesTopBottom = []
		
		placeSpikes "left"
		placeSpikes "right"
		placeSpikes "topbottom"
	end#initialize
	
	def activeUpdate
		if @window.button_down?(Gosu::KbSpace)
			@bird.velY = -2
		end
		
		@bird.update
	end#activeUpdate
	
	def activeDraw
		@spikesLeft.each do |spike|
			spike.draw
		end
				
		@spikesRight.each do |spike|
			spike.draw
		end
		
		@spikesTopBottom.each do |spike|
			spike.draw
		end
		
		@bird.draw
	end#activeDraw
	
	def hitSide(side)
		if side == "left"
			placeSpikes "right"
		else
			placeSpikes "left"
		end
		
		@score += 1
	end
	
	def placeSpikes(direction)
		if direction == "left" or direction == "right"
			#Determine how many spikes to place
			spikesCount = 0
			spikesQuota = 3 + (@score / 5).floor#Adds another spike for every 5 points
			
			spikes = []
			
			if direction == "left"
				@spikesLeft.each do |spike|
					@bird.stopCheckingFor spike
				end
				
				rotation = 0
				x = 20
			else
				@spikesRight.each do |spike|
					@bird.stopCheckingFor spike
				end
				
				rotation = 180
				x = @window.width
			end
			
			y = 30
			
			while y <= @window.height and spikesCount < spikesQuota
				spike = Spike.new @window, x, y, rotation
				spikes.push spike
				
				@bird.checkFor spike
				
				y += 30
				spikesCount += 1
			end 
			
			if direction == "left"
				@spikesLeft = spikes
			else			
				@spikesRight = spikes
			end
		else
			x = 30
			y = 0
			rotation = 90
			
			while x <= @window.width
				spike = Spike.new @window, x, y, rotation
				@spikesTopBottom.push spike
				
				@bird.checkFor spike
				
				x += 30
			end
			
			x = 30
			y = @window.height
			rotation = 270
			
			while x <= @window.width
				spike = Spike.new @window, x, y, rotation
				@spikesTopBottom.push spike
							
				@bird.checkFor spike
				
				x += 30
			end
		end
	end#placeSpikes
end#GameScreen