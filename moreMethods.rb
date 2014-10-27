def better_gets
	result = gets.chomp
	
	while result.length == 0
		puts "Try again"
		result = gets.chomp
	end
	
	return result
end


def quadratic(a, b, c)
	an1 = ((-1 * b) + Math.sqrt((b * b) - (4 * a * c))) / (2 * a)
	an2 = ((-1 * b) - Math.sqrt((b * b) - (4 * a * c))) / (2 * a)
	
	puts "The answers are #{an1} and #{an2}"
end

def average(num1, num2)
	return (num1 + num2) / 2
end

puts "What is your name?"
puts better_gets

quadratic(1, -3, 2)

avrg = average(2, 8)
puts "The average of 2 and 8 is #{avrg}"