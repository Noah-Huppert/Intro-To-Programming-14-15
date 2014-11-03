gradesArray = [89, 78, 99, 85]

gradesSum = 0

gradesArray.each{ |grade|
  gradesSum += grade
}

puts "The total grades of #{gradesArray} is #{gradesSum}"
