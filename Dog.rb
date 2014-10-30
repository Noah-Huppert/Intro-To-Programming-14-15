class Dog
  def initialize(name, breed)
    @name = name
    @breed = breed
    @age = 0
  end#initialize

  def info
    yearsSuffix = "s"

    if @age == 1
      yearsSuffix = ""
    end

    puts "My name is #{@name}, I am #{@age} year#{yearsSuffix} old, and I am a #{@breed}"
  end#info

  def speak
    puts "Woof, Woof!"
  end#speak

  def birthday
    @age += 1
  end#birthday
end#Dog

#Use Dog class
foo = Dog.new("foo", "beagle")
bazz = Dog.new("bazz", "pug")
bar = Dog.new("bar", "labrador")

foo.birthday
foo.birthday

bazz.birthday
bazz.birthday
bazz.birthday

foo.info
bazz.info
bar.info
