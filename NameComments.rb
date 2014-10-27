while true
	age = -1

	while age <= 0 || age >= 110
		puts "********** What is your age? **********"
		age = gets.chomp.to_i
	end

	if age > 0 && age <= 15
		puts "Not old enough to drive :("
	elsif age == 16
		puts "You can get your permit now"
	elsif age > 16 && age < 25
		puts "You are in school of some sort!"
	else
		puts "Retiring yet?"
	end
end