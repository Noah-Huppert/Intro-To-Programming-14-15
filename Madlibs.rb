#Helper methods
def ask(prompt)
	puts prompt
	return gets.chomp.downcase
end

def gimme(name)
	return ask("Give me a #{name}")
end

#Get values
charName = gimme("name").capitalize
charGender = gimme("gender")
place = gimme("place").capitalize
placeSize = gimme("size")
streetName = gimme("street name")
animal = gimme("animal")
ingVerb = gimme("verb ending in \"ing\"")
instrument = gimme("instrument")
schoolClass = gimme("school class")
mathProblem = gimme("math prolem")
mathAnswer = gimme("answer to the math problem")
teacherName = gimme("teacher name(Prefixed with Mrs. or Ms. or Mr)")

#Tell story
puts "\n\n\n\n\n\n\n********** Start Of Story **********\n"
puts "There once was a #{charGender} named #{charName} who lived in #{place}."
puts "#{place} was a #{placeSize} town."
puts "One day the #{charGender} was walking down a street named #{streetName} when he saw a #{animal}."
puts "But this was no ordinary #{animal}, this #{animal} was #{ingVerb} a #{instrument}."
puts "#{charName} stopped at #{streetName} and looked at the #{animal} in disbelief, how could a #{animal} be #{ingVerb} a #{instrument}?"
puts "Just as #{charGender} was about to walk away the #{animal} spoke: \"You may be wondering how I am speaking\" the #{animal} said, \"Or how I am #{ingVerb} the #{instrument}\" the #{animal} said, \"the answer is, you are in #{schoolClass}, you are sleeping. But luckily I am a time traveling #{animal}, and I can prove it. Your teacher #{teacherName} is about to ask you what the answer to #{mathProblem} is, the answer is #{mathAnswer}\""
puts "And just then #{charName} heard his teacher #{teacherName} ask what the answer to #{mathProblem} was. And just like the time traveling #{animal} #{ingVerb} the #{instrument} said, the answer was #{mathAnswer}"
