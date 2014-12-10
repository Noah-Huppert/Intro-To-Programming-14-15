require "gosu"
require "./models/screens/GameScreen"
require "./models/screens/GameOverScreen"

class SpikesGame < Gosu::Window
	attr_accessor :gameScreen, :gameOverScreen
	
	def initialize
		super 400, 600, false
		
		@gameScreen = GameScreen.new self
		@gameOverScreen = GameOverScreen.new self
		@gameOverScreen.active = false
	end#initialize
	
	def draw
		self.draw_quad(0, 0, Gosu::Color.argb(0xffffffff), self.width, 0, Gosu::Color.argb(0xffffffff), self.width, self.height, Gosu::Color.argb(0xffffffff), 0, self.height, Gosu::Color.argb(0xffffffff))
		@gameScreen.draw
		@gameOverScreen.draw
	end#draw
	
	def update
		@gameScreen.update
		@gameOverScreen.update
	end#update
end#SpikesGame

spikeGame = SpikesGame.new
spikeGame.show