puts "What is your age(Years)?"
age = gets.chomp.to_i
days = age * 365
minutes = days * 1440
seconds = days * 86400

puts "You are #{days} days old"
puts "You are #{minutes} minutes old"
puts "You are #{seconds} seconds old"