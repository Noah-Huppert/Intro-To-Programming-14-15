class Car
	def initialize(make, model, year, price, color)
		@make = make
		@model = model
		@year = year
		@price = price
		@color = color
	end#initialize

	#Actions
	def describe(prefix)
		puts "#{prefix} #{@year} #{@make} #{@model}, #{@color} - $#{@price}"
	end#describe

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

def printCars(carArray)
	i = 1
	carArray.each{ |car|
		car.describe("#{i}) ")

		i += 1
	}

end#printCars

#Make default cars
cars = [
	Car.new("Honda", "Civic", 2014, 20000, "Red"),
	Car.new("Ford", "F-150", 2014, 24000, "Green"),
	Car.new("Saab", "9-5", 1990, 2, "Brown"),
	Car.new("Toyota", "Corolla", 2014, 15000, "Green"),
	Car.new("Porsche", "911", 2014, 85000, "Orange"),
	Car.new("Ford", "Bronco", 2002, 150000, "White"),
	Car.new("Maserati", "Granturismo", 2012, 126000, "Blue"),
	Car.new("McLaren", "P1", 2013, 1350000, "Orange"),
	Car.new("Lotus", "Exige", 2010, 65000, "Orange"),
	Car.new("Pontiac", "Aztec", 2001, 8000, "Blue")
]

#cars = cars.sort { |a,b| a.getPrice <=> b.getPrice }

puts "Here are the cars to choose from"
printCars(cars)

filterChoices = prompt("\nWhat would you like to filter by?(You may choose more than one)
	Make
	Model
	Year
	Price
	Color").downcase

filtering = {
	:make => filterChoices.include?("make"),
	:model => filterChoices.include?("model"),
	:year => filterChoices.include?("year"),
	:price => filterChoices.include?("price"),
	:color => filterChoices.include?("color")
}

filters = {}

if filtering[:make]
		filters[:make] = prompt("What \"make\" would you like to filter by?").downcase
end

if filtering[:model]
	filters[:model] = prompt("What \"model\" would you like to filter by?").downcase
end

if filtering[:year]
	filters[:year] = prompt("What \"year\" would you like to filter by?").to_i
	filters[:yearGL] = prompt("Would you like to filter cars by greater or less than for the \"year\"?").downcase
end

if filtering[:price]
	filters[:price] = prompt("What \"price\" would you like to filter by?").to_i
	filters[:priceGL] = prompt("Would you like to filter cars by greater or less than for the \"price\"?").downcase
end

if filtering[:color]
	filters[:color] = prompt("What \"color\" would you like to filter by?").downcase
end

validCars = []

cars.each{ |car|
	valid = true

	if filtering[:make]
			if car.getMake.downcase != filters[:make]
				valid = false
			end
	end

	if filtering[:model]
		if car.getModel.downcase != filters[:model]
			valid = false
		end
	end

	if filtering[:year]
		if filters[:yearGL].include? "great" and car.getYear < filters[:year]
			valid = false
		end

		if filters[:yearGL].include? "less" and car.getYear > filters[:year]
			valid = false
		end
	end

	if filtering[:price]
		if filters[:priceGL].include? "great" and car.getPrice < filters[:price]
			valid = false
		end

		if filters[:priceGL].include? "less" and car.getPrice > filters[:price]
			valid = false
		end
	end

	if filtering[:color]
		if car.getColor.downcase != filters[:color]
			valid = false
		end
	end

	if valid
		validCars.push car
	end
}

puts "Here are your valid cars"
printCars(validCars)
