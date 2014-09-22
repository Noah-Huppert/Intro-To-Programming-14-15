$angle1 = 0
$angle2 = 0
$angle3 = 0

def getAngles
	puts "**********"
	puts "I need 1 angle from a triangle"
	$angle1 = gets.chomp.to_i
	puts "I need another angle from the same triangle"
	$angle2 = gets.chomp.to_i
	checkAngles
end

def calcThirdAngle
	bothAngles = $angle1 + $angle2
	
	newAngle = 180 - bothAngles
	
	return newAngle
end

def checkAngles
	if calcThirdAngle <= 0
		puts "Your angles must be valid"
		getAngles
	else
		$angle3 = calcThirdAngle
		showAngles
	end
end

def showAngles
	puts "Your third angle is #{$angle3}"
end

getAngles