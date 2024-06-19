class Person
  attr_accessor :age
  def initialize(age)
    @age = age
  end
  def compare_age(other_person)
    if self.age < other_person.age
      puts "You are younger than the other person"
    elsif self.age > other_person.age
      puts "You are older than the other person"
    elsif self.age == other_person.age
      puts "You both have the same age"
    end
  end
end

person1 = Person.new(32)
person2 = Person.new(32)

puts person2.compare_age(person1)
