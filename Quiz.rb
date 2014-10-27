puts "Hello! What is your name?"
name = gets.chomp

puts "Thanks #{name}"

number = -1
firstNumAsk = true

while number  < 0
	if firstNumAsk
		puts "Please enter a number above 0"
		firstNumAsk = false
	else
		puts "Can't use that number"
		firstNumAsk = false
	end
	
	number = gets.chomp.to_i
end
	
countingNum = 0

while countingNum + 5 <= number
	countingNum += 5
	puts "#{countingNum}"
end
