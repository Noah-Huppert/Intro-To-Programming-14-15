wantsToPlay = true
while wantsToPlay
	puts "I have thought of a number between 1 and 100, try and guess it "

	num = rand(100) + 1
	an = gets.chomp.to_i

	while an != num
		dif = an - num
		
		if dif < 0 && dif > -11
			puts "#{an} is low, put really close!"
		elsif dif < 0
			puts "#{an} is to low"
		end
		
		if dif > 0 && dif < 11
			puts "#{an} is high, put really close!"
		elsif dif > 0
			puts "#{an} is to high"
		end
			
		an = gets.chomp.to_i
	end

	puts "Correct! My number is #{num}"
	
	puts "Would you like to play again?(yes/no)"
	
	wantsToPlayPrompt = gets.chomp.upcase
	
	while wantsToPlayPrompt != "YES" && wantsToPlayPrompt != "NO"
		puts "Would you like to play again?(yes/no)"
		wantsToPlayPrompt = gets.chomp.upcase
	end
	
	if wantsToPlayPrompt == "YES"
		wantsToPlay = true
	else
		wantsToPlay = false
	end
end