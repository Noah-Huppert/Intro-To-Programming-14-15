gradesArray = [89, 78, 99, 85]

gradesSum = 0

gradesArray.each do |grade|
  grade += 10
  gradesSum += grade
end

puts "The total grades is #{gradesSum}"
