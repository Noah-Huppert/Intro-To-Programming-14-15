class Car
	def initialize(make, model, year, price, color)
		@make = make
		@model = model
		@year = year
		@price = price
		@color = color
	end#initialize
end#Car

def prompt(prefix)
	puts prefix

	return gets.chomp
end#prompt

#Make default cars
cars = [
	Car.new("Honda", "Civic", 2014, 20000, "Red"),
	Car.new("Ford", "F-150", 2014, 24000, "Green"),
	Car.new("Saab", "9-5", 1990, 2, "Brown"),
	Car.new("Toyota", "Corolla", 2014, 15000, "Purple"),
	Car.new("Porsche", "911", 2014, 85000, "Orange")
]

budget = prompt("What is your budget?").to_i
