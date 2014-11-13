def prompt(prefix)
	puts prefix

	return gets.chomp
end#prompt

grades = []
latestGradeInput = prompt("Enter a grade, or type \"done\" to continue")

while latestGradeInput != "done"
	if latestGradeInput.to_i == 0 && latestGradeInput != "0"
		puts "Please enter a valid input"
	end
	
	grades.push latestGradeInput.to_i
	latestGradeInput = prompt("Enter a grade, or type \"done\" to continue")
end

totalGrades = 0

grades.each{ |grade| 
	totalGrades += grade
}

gradeAvrg = totalGrades / grades.length

puts "The average of the grades is #{gradeAvrg}"
