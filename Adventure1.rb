puts "You are riding your bike and you see a wildcat, what do you do?"
puts "1. Give it candy\n2. Bike away\n3. Give it an apple\n\n"
an = gets.chomp.to_i

if an == 1
	puts "The wildcat thanks you and you go on your way"
elsif an == 2
	puts "The wildcat runs after you and wants to be your friend"
elsif an == 3
	puts "The wildcat thanks you for giving it an apple. It is extra happy that you gave it and apple because it is watching its weight"
end
puts "Thanks for playing!"