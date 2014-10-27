while true
	puts "********** Choose a number **********"

	number = gets.chomp.to_i
	
	puts "#{number % 3}"
	
	if (number % 3) == 0
		puts "#{number} is divisible by 3"
	else
		puts "#{number} is not divisible by 3"
	end
		
	if (number % 7) == 0
		puts "#{number} is divisible by 7"
	else
		puts "#{number} is not divisible by 7"
	end
end