while true
	puts "Choose a number"
	number = gets.chomp.to_i
	
	toCheck = 2
	notPrime = false
	divBy = []
	
	while toCheck < number
		if (number % toCheck) == 0
			notPrime = true
			divBy.push(toCheck)
		end#if
		
		toCheck += 1
	end#while
	
	if notPrime
		divByPretty = divBy.join(", ")
		puts "#{number} is not prime, it is divisble by #{divByPretty}"
	else
		puts "#{number} is prime"
	end#Not prime
end#While