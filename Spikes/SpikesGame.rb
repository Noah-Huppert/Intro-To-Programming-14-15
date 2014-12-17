require "gosu" 
require "./models/super/ScreenManager"
require "./models/screens/GameStartScreen"
require "./models/screens/GameScreen"
require "./models/screens/GameOverScreen"

class SpikesGame < Gosu::Window
	attr_accessor :screenManager
	
	def initialize
		super 400, 600, false
		self.caption = "Spikes"
		
		@screenManager = ScreenManager.new self
		
		@screenManager.addScreen "gameStartScreen", GameStartScreen.new(self)
		@screenManager.addScreen "gameScreen", GameScreen.new(self)
		@screenManager.addScreen "gameOverScreen", GameOverScreen.new(self)
		
		@screenManager.activate "gameStartScreen"
	end#initialize
	
	def draw
		self.draw_quad(0, 0, Gosu::Color.argb(0xffffffff), self.width, 0, Gosu::Color.argb(0xffffffff), self.width, self.height, Gosu::Color.argb(0xffffffff), 0, self.height, Gosu::Color.argb(0xffffffff))
		@screenManager.draw
	end#draw
	
	def update
		@screenManager.update
	end#update
end#SpikesGame

spikeGame = SpikesGame.new
spikeGame.show  