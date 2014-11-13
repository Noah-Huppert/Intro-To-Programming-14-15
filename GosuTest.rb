require "gosu"

class Window < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Gosu Test"

    @font = Gosu::Font.new(self, "Arial", 18)
  end#initialize

  def update

  end#update

  def draw
    @font.draw("TEXT", 10, 10, 1)
  end#draw
end#Window

window = Window.new
window.show
