require "./models/super/Screen"
require "./models/gameObjects/Bird"
require "./models/gameObjects/Spike"

class GameScreen < Screen
	attr_accessor :score
	
	def initialize(window)
		super(window)
		
		@bird = Bird.new @window
		@bird.startX
		
		@score = 0
		
		@spikesLeft = []
		@spikesRight = []
		@spikesTopBottom = []
		
		@scoreFont = Gosu::Font.new(@window, "System", 200)
		
		placeSpikes "topbottom"
	end#initialize
	
	def activeUpdate
		if @window.button_down?(Gosu::KbSpace)
			@bird.velY = -3
		end
		
		@bird.update
	end#activeUpdate
	
	def activeDraw
		scoreX = (@window.width / 2) - 50
		
		if @score >= 10
			scoreX = (@window.width / 2) - 115
		end
		
		@scoreFont.draw("#{@score}", scoreX, (@window.height / 2) - 100, 0, 1, 1, Gosu::Color.argb(0xff808080))
		
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
			
			@spikesLeft.each do |spike|
				@bird.stopCheckingFor spike
			end
			
			@spikesLeft = []
		else
			placeSpikes "left"
			
			@spikesRight.each do |spike|
				@bird.stopCheckingFor spike
			end
			
			@spikesRight = []
		end
		
		@score += 1
	end
	
	def placeSpikes(direction)
		if direction == "left" or direction == "right"
			#Determine how many spikes to place
			spikesCount = 0
			spikesQuota = 3 + (@score / 5).floor#Adds another spike for every 5 points
			
			if spikesQuota > 10#After 10 spikes it becomes impossible
				spikesQuota  = 10
			end
			
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
			
			while spikesCount < spikesQuota
				y = rand(@window.height)
				
				notToClose = true
				
				if y <= 40
					notToClose = false
				elsif y >= @window.height - 40
					notToClose = false
				else
					spikes.each do |spike|
						spikeDif = (spike.y - y).abs
						if spikeDif <= 35
							notToClose = false
						end
					end
				end
				
				if notToClose
					spike = Spike.new @window, x, y, rotation
					@bird.checkFor spike
					spikes.push spike
					spikesCount += 1
				end
			end
			
			if direction == "left"
				@spikesLeft = spikes
			else			
				@spikesRight = spikes
			end
		else
			x = 35
			y = 20
			rotation = 90
			
			while x <= @window.width
				spike = Spike.new @window, x, y, rotation
				@spikesTopBottom.push spike
				
				@bird.checkFor spike
				
				x += 25
			end
			
			x = 35
			y = @window.height
			rotation = 270
			
			while x <= @window.width
				spike = Spike.new @window, x, y, rotation
				@spikesTopBottom.push spike
							
				@bird.checkFor spike
				
				x += 25
			end
		end
	end#placeSpikes
end#GameScreen