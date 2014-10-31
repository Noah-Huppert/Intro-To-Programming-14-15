begin
	require "./ruby/2.0.0/gems/colorize-0.7.3/lib/colorize.rb"
 LoadError
	puts "[ERROR] You must run \"bundle install --path ./\" in the console"
	puts "[ERROR] This will install \"colorize\" which allows me to have cool console colors"
	exit
end

class Car
	def initialize(make, model, year, price, color)
		@make = make
		@model = model
		@year = year
		@price = price
		@color = color
	end#initialize

	# Getters
	def getMake
		@make
	end#getMake

	def getModel
		@model
	end#getModel

	def getYear
		@year
	end#getYear

	def getPrice
		@price
	end#getPRice

	def getColor
		@color
	end#getColor
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

#cars = cars.sort { |a,b| a.getPrice <=> b.getPrice }

filterChoices = prompt("What would you like to filter by?(You may choose more than one)").downcase
puts "	Make"
puts "	Model"
puts "	Year"
puts "	Price"
puts "	Color"

filtering = {
	:make => filterChoices.include?("make"),
	:model => filterChoices.include?("model"),
	:year => filterChoices.include?("year"),
	:price => filterChoices.include?("price"),
	:color => filterChoices.include?("color")
}

filters = {}

if filtering[:make]
		filters[:make] = prompt("What" + "make".blue + "would you like to filter by?")
end

if filtering[:model]
	filters[:mode] = prompt("What model would you like to filter by?")
end
