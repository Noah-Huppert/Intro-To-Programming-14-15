def wannaNum(name)
	puts "I need #{name}"
	fl = gets.chomp.to_f
	
	return fl
end

puts "********** Quadratic Formula Solver **********"

a = wannaNum("A")
b = wannaNum("B")
c = wannaNum("C")

an1 = ((-1 * b) + Math.sqrt((b * b) - (4 * a * c))) / (2 * a)
an2 = ((-1 * b) - Math.sqrt((b * b) - (4 * a * c))) / (2 * a)

puts "#{an1} #{an2}"