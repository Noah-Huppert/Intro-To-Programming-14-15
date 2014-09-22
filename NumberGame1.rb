puts "I have thought of a number between 1 and 10, try and guess it"

num = rand(10) + 1
an = gets.chomp.to_i

while an != num
	if an > num
		puts "#{an} is to high, try again."
	end

	if an < num
		puts "#{an} is to low, try again"
	end

	an = gets.chomp.to_i
end

puts "Correct! My number is #{num}"