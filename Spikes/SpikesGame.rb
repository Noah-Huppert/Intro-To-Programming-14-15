require "gosu"
require "./models/GameScreen"

class SpikesGame < Gosu::Window
	def initialize
		super 400, 600, false
		
		@gameScreen = GameScreen.new self
	end#initialize
	
	def draw
		self.draw_quad(0, 0, Gosu::Color.argb(0xffffffff), self.width, 0, Gosu::Color.argb(0xffffffff), self.width, self.height, Gosu::Color.argb(0xffffffff), 0, self.height, Gosu::Color.argb(0xffffffff))
		@gameScreen.draw
	end#draw
	
	def update
		@gameScreen.update
	end#update
	
	def setGameScreenActive(active)
		@gameScreen.active = false
	end
end#SpikesGame

spikeGame = SpikesGame.new
spikeGame.show