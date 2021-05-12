#1. Create a superclass called `Vehicle` for your `MyCar` class to inherit from and move the behaviour that isn't specific to the `MyCar` class to the superclass. 
# Create a constant in your `MyCar` class that stores information about the vehicle that makes it different from other types of Vehicles. Then create a new class called `MyTruck` that inherits from your superclass that also has a constant defined that separates it from the `MyCar` class in some way.

class Vehicle                                          # (1)
  def self.gas_mileage(gallons, miles)                          
    puts "#{miles/gallons} miles per gallon of gas"
  end
  
  attr_accessor :color                    
  attr_reader :year                       
  
  def initialize(year, color, model)      
    @year = year
    @color = color
    @model = model
    @current_speed = 0                    
  end

  def speed_up(number)                    
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)                       
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."

  end

  def shut_off                            
    @current_speed = 0
    puts "The car is now off"
  end

  def current_speed                      
    puts "You are now going #{@current_speed} mph."
  end

  def spray_paint(spray_color)            
    self.color = spray_color
    puts "The new color of your car is #{@color}."
  end
end

class MyCar < Vehicle                                 # (2)
  MAIN_USE = "travel"                                 # (4)
  
  def to_s                                                  
    "This car model is #{@model}, its color is #{color} and it was made in #{year}."
  end
end
   
class MyTruck < Vehicle                               # (3)
  MAIN_USE = "work"                                   # (4)
   
  def to_s                                                  
    "This truck model is #{@model}, its color is #{color} and it was made in #{year}."
  end
end

car_1 = MyCar.new(2021, "blue", "Skoda")              # (5)
truck_1 = MyTruck.new(2019, "black", "Mercedes")

puts car_1
puts truck_1

car_1.spray_paint('red')                              # (6)
puts car_1

truck_1.speed_up(20)
puts truck_1.current_speed
puts car_1.current_speed

=begin
#(1) We create the superclass `Vehicle` that takes all functionality that isn't specific to one car but to all vehicles.
#(2) The `MyCar` class now only contains functions that are specific to cars. We use `<` for this class to inherit from `Vehicles`.
#(3) We create a new class `MyTruck` that contains functions that are specific to trucks. As above, we use `<` for this class to inherit from `Vehicles`.
#(4) Now the problem request us to create a constant variable for each of our classes that contains information about the car or the truck that is unique to them. In this case we've chosen to put the main use that each vehicle has: travel for cars and work for trucks.
#(5) We instantiate a `MyCar` class object and a `MyTruck` class object, passing in the corresponding arguments.
#(6) Now we can see the all the functions from `Vehicles` are inherit by `MyCar` and `MyTruck`. 
=end

# =====================================

#2. Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass. Create a method to print out the value of this class variable as well.

class Vehicle
  
  attr_accessor :color                    
  attr_reader :year                       
  
  @@number_of_vehicles = 0                      # (1)
  
  def initialize(year, color, model)      
    @year = year
    @color = color
    @model = model
    @current_speed = 0      
    @@number_of_vehicles += 1                   # (2)
  end

  def self.total_number_of_vehicles             # (3)
    puts "You have created #{@@number_of_vehicles} vehicles."
  end
  
  def self.gas_mileage(gallons, miles)                          
    puts "#{miles/gallons} miles per gallon of gas"
  end
  
  def speed_up(number)                    
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)                       
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."

  end

  def shut_off                            
    @current_speed = 0
    puts "The car is now off"
  end

  def current_speed                      
    puts "You are now going #{@current_speed} mph."
  end

  def spray_paint(spray_color)            
    self.color = spray_color
    puts "The new color of your car is #{@color}."
  end

end

class MyCar < Vehicle
  
  PRICE = 20_000
  
  def to_s                                                  
    "This car model is #{@model}, its color is #{color} and it was made in #{year}."
  end
  
end
   
class MyTruck < Vehicle
  
  PRICE = 50_000
  
  def to_s                                                  
    "This truck model is #{@model}, its color is #{color} and it was made in #{year}."
  end
  
end

car_1 = MyCar.new(2021, "blue", "Skoda")    
truck_1 = MyTruck.new(2019, "black", "Mercedes")

puts Vehicle.total_number_of_vehicles                # (4)
# => You have created 2 vehicles.

=begin
#(1) We are asked to create a class variable. To do so we prepend the variable name with `@@`.
#(2) This variable, initialize to `0`, needs to be updated every time we  create a new vehicle, not matter of what class. To do so, in the `initialize` method we reassign the class variable `@@number_of_vehicles` to + 1 every time we create a new object of the `MyCar` or `MyTruck` classes.
#(3) We are also request to create a method to print out the value of the `@@number_of_vehicles` class variable. We need a class method, which is created using `self` followed by the method name of our choice. In this case, inside the class method, we interpolate the current value of the class variable. Alternatively we can just return the value of the class variable itself, without any message.
#(4) To see the result of the changes, we invoke the method `total_number_of_vehicles` on the `Vehicle` class and will output the number of vehicles interpolated in a string.
=end

# ===========================================

#3. Create a module that you can mix in to ONE of your subclasses that describes a behaviour unique to that subclass.

module Loadable                  # (1)
  def load
    "I can be loaded with building material, goods, or anything you want."
  end
end

class Vehicle
  
  attr_accessor :color                    
  attr_reader :year                       
  
  @@number_of_vehicles = 0
  
  def initialize(year, color, model)      
    @year = year
    @color = color
    @model = model
    @current_speed = 0      
    @@number_of_vehicles += 1
  end

  def self.total_number_of_vehicles
    puts "You have created #{@@number_of_vehicles} vehicles."
  end
  
  def self.gas_mileage(gallons, miles)                          
    puts "#{miles/gallons} miles per gallon of gas"
  end
  
  def speed_up(number)                    
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)                       
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."

  end

  def shut_off                            
    @current_speed = 0
    puts "The car is now off"
  end

  def current_speed                      
    puts "You are now going #{@current_speed} mph."
  end

  def spray_paint(spray_color)            
    self.color = spray_color
    puts "The new color of your car is #{@color}."
  end

end

class MyCar < Vehicle
  PRICE = 20_000
  
  def to_s                                                  
    "This car model is #{@model}, its color is #{color} and it was made in #{year}."
  end
  
end
   
class MyTruck < Vehicle
  PRICE = 50_000
  
  include Loadable               # (2)
  
  def to_s                                                  
    "This truck model is #{@model}, its color is #{color} and it was made in #{year}."
  end
  
end

car_1 = MyCar.new(2021, "blue", "Skoda")    
truck_1 = MyTruck.new(2019, "black", "Mercedes")

puts truck_1.load                # (3)

=begin
#(1) The problem request to create a module to describe an unique behaviour to one of our subclasses. We opted to create a module `Loadable` that describes the capacity of a vehicle to accept load.
#(2) We mix in the module with the `MyTruck` class by using the `include` method.
#(3) To visualize the result of our new feature, we invoke the `load` method included in the `Loadable` module, by calling it in an object of the class `MyTruck`. If we tried to invoke the `load` method in an object of the `MyCar` class, it'll throw and error, because the module isn't mix in with this class.
=end

#==================================

#4. Print to the screen your method lookup for the classes that you have created.

puts "MyCar lookup path"
puts MyCar.ancestors
puts ""
puts "MyTruck lookup path"
puts MyTruck.ancestors
puts ""
puts "Vehicle lookup path"
puts Vehicle.ancestors

=begin
MyCar lookup path
MyCar
Vehicle
Object
PP::ObjectMixin
Kernel
BasicObject

MyTruck lookup path
MyTruck
Loadable
Vehicle
Object
PP::ObjectMixin
Kernel
BasicObject

Vehicle lookup path
Vehicle
Object
PP::ObjectMixin
Kernel
BasicObject
=end

# 1. To see the method lookup path for our different classes we use the class method `ancestors`

#========================================

#5. Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class. Make sure that all of your previous method calls are working when you are finished.

#This was done on exercise 1.

#========================================

#6. Write a method called age that calls a private method to calculate the age of the vehicle. Make sure the private method is not available from outside of the class. You'll need to use Ruby's built-in Time class to help.

module Loadable
  def load
    "I can be loaded with building material, goods, or anything you want."
  end
end

class Vehicle
  
  attr_accessor :color                    
  attr_reader :year                       
  
  @@number_of_vehicles = 0
  
  def initialize(year, color, model)      
    @year = year
    @color = color
    @model = model
    @current_speed = 0      
    @@number_of_vehicles += 1
  end

  def self.total_number_of_vehicles
    puts "You have created #{@@number_of_vehicles} vehicles."
  end
  
  def self.gas_mileage(gallons, miles)                          
    puts "#{miles/gallons} miles per gallon of gas"
  end
  
  def age_of_vehicle                      # (1)
    puts "Your vehicle is #{years_old} years old."
  end
  
  private                                 # (2)
  
  def years_old                           # (3)
    Time.now.year - self.year 
  end
  
  def speed_up(number)                    
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)                       
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."

  end

  def shut_off                            
    @current_speed = 0
    puts "The car is now off"
  end

  def current_speed                      
    puts "You are now going #{@current_speed} mph."
  end

  def spray_paint(spray_color)            
    self.color = spray_color
    puts "The new color of your car is #{@color}."
  end

end

class MyCar < Vehicle
  PRICE = 20_000
  
  def to_s                                                  
    "This car model is #{@model}, its color is #{color} and it was made in #{year}."
  end
  
end
   
class MyTruck < Vehicle
  PRICE = 50_000
  
  include Loadable
  
  def to_s                                                  
    "This truck model is #{@model}, its color is #{color} and it was made in #{year}."
  end
  
end

car_1 = MyCar.new(2021, "blue", "Skoda")    
truck_1 = MyTruck.new(2019, "black", "Mercedes")

truck_1.age_of_vehicle                      # (4)
# => Your vehicle is 2 years old.
car_1.age_of_vehicle
# => Your vehicle is 0 years old.

=begin
# (1) We are asked to create a method to calculate the age of a vehicle. We first create a method `age_of_vehicle` that outputs the current age in years of any vehicle. We include this method in the `Vehicle` class.
# (2) We want the `age_of_vehicle` method to call a private method which does the calculation. To determine that that second method is private, we write the method following the `private` method.
# (3) The method which actually calculates the age of a vehicle, includes the built-in method `Time` followed by the `now` and `year` methods, which returns the current year. The calculation is done by deducting the `year` of the vehicle from the current year given by the `Time` method. This calculation will only be possible if the `year` instance variable holds integers. We can make it `year.to_i` so it deals with whatever object type we pass to `year` whether that's a string or an integer.
# (4) To visualize this new feature, we call the `age_of_vehicle` method on an object of the `MyCar` or `MyTruck` classes.
=end

# ==========================================

#7. Create a class `'Student'` with attributes `name` and `grade`. Do NOT make the `grade` getter public, so `joe.grade` will raise an error. 
# Create a `better_grade_than?` method, that you can call like so: `puts "Well done!" if joe.better_grade_than?(bob)`

class Student                                      # (1)

  def initialize(name, grade)                      # (2)
    @name = name
    @grade = grade
  end
  
  def better_grade_than?(name)                     # (5)
    grade > name.grade
  end
  
  protected                                        # (3)
  
  def grade                                        # (4)
    @grade
  end
  
end

joe = Student.new("Joe", 8.75)                     # (6)
bob = Student.new("Bob", 6.50)

puts "Well done!" if joe.better_grade_than?(bob)   # (7)
# => Well done!
puts joe.grade                                     # (8)
# => NoMethodError: protected method `better_grade_than?'

=begin
# (1) We create the `Student` class as required
# (2) The new class have attributes `name` and `grade`. Attributes of a class are included in the `initialize` method.
# (3) We need a `grade` getter method that is not public (protected). To do so we use the `protected` method and to follow...
# (4) ...we define the protected getter method to access the `grade`. Remember that:
    - from inside the class, `protected` methods are accessible just like `public` methods.
    - from outside the class, `protected` methods act just like `private` methods.
# (5) Finally we are required to create a `better_grade_than` method that will return true or false if the condition within it is truthy or falsey. In this case the condition is is current student grade larger than other student grade? (notice that although the `grade` getter method is protected, it this accessible from inside the class.
# (6) We need to instantiate some objects of the class
# (7) And we try if our call to the method works, and it does!
# (8) Finally we are making sure that the grade getter method is not public. We can see that when we try to invoke the method outside the class, it throws an error: 
`protected method `better_grade_than?'`
=end

# ==================================

#8. Given the following code and the corresponding error message...What is the problem and how would you go about fixing it?

bob = Person.new
bob.hi

# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>

=begin
The problem is that the method `hi` is a private method, therefore it is unavailable to the object. 
We could fix this problem by moving the `hi` method above the `private` method call in the class.
The rest of the code that isn't given to us in the example may look like this:
=end

class Person
	# some more code perhaps

	private                     # (1)

	def hi                      # (2)
		puts 'hi'	
	end
end

bob = Person.new
bob.hi                        # (3)
# => NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>

=begin
# (1) We see that the `private` method precedes the...
# (2) ... `hi` instance method, which makes it private so not accessible outside the class...
# (3) ...as we can see when we invoke it on the class object `bob`.
=end

#We can do two things to make this method public:

#1. We can remove the `private` method line
    
class Person
  # some more code perhaps

  def hi                      # (1)
    puts 'hi'	
  end
end

bob = Person.new
bob.hi                        # (2)
# => hi
    
=begin
# (1) Now, after removing the `private` method, the `hi` method is public and accessible from outside the class.
# (2) as we can see when we call it on the class object `bob`
=end

#2. Or we can replicate the `hi` method and make the replica public. We don't know much about this code, but the `hi` method was made private probably for a good reason, to protect some information perhaps.

class Person
  # some more code perhaps
  
  def public_hi               # (1)
    puts 'hi'
  end
  
  private                     # (2)

  def hi                      # (3)
    puts 'hi'	
  end
end

bob = Person.new
bob.public_hi                 # (4)
# => hi

=begin
# (1) We create a `public_hi` method, which is a replica of the private `hi` method.
# (3) The `private` method still exists
# (3) which keeps the `hi` method protected and inaccessible from outside the class.
# (4) Now the `public_hi` method can be called in the `bob` object with no problem.
=end