def say_hello
	3.times do
		puts "Hello"
	end
end

def say_hello_to(name)
	3.times do
		puts "Hello #{name}"
	end
end

def say_hello_times(name, number)
	number.times do
		puts "Hello #{name}"
	end
end

def not_like(food)
	return "I don't like #{food}"
end

say_hello
say_hello_to("Noah")
say_hello_times("Noah", 2)
puts not_like("rice")#Such a lie, I love rice, but whatever