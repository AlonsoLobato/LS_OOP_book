#1. Add a class method to your `MyCar` class that calculates the gas mileage of any car.

class MyCar     

  attr_accessor :color                    

  attr_reader :year                       

	def self.gas_mileage(gallons, miles)                          # (1)
    puts "#{miles/gallons} miles per gallon of gas"
  end

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
   
MyCar.gas_mileage(13, 351)                                        # (2)                   

=begin
#(1) We want a method that calcules the gas milage of any car. To do that **we use a class method**, because the way the gas milage is calculated is always in the same way, miles divided by gallons, and that does not depend on the type of car. 

    Note that our class method accepts two arguments, miles and gallons, and that to specify that this is a class method, we need to prepend the name of the method with the keyword `self`. 

    Inside the method, using string interpolation, we do the calculation and output the result. 

#(2) To test this class method, we don't need an instance of the class, because the class method itself, so we just do `MyCar.gas_milage` and pass the two arguments.
=end

#=============================

#2. Override the to_s method to create a user friendly print out of your object.

class MyCar     

  attr_accessor :color                    

  attr_reader :year                       

	def self.gas_mileage(gallons, miles)                          
    puts "#{miles/gallons} miles per gallon of gas"
  end

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

	def to_s                                                  # (1) & (2)
    "This car model is #{@model}, its color is #{color} and it was made in #{year}."
  end

end
   
skoda = MyCar.new(2021, "blue", "Kamiq")    
puts skoda                                                  # (3)
# => This car model is Kamiq, its color is blue and it was made in 2021.

=begin
#(1) We can create our own version of `to_s` method if we want it to output more miningful information. Otherwise, `puts` would call the default `to_s` that returns the name of the object's class and an encoding of the object id (something like this `<skoda:0x007fe542323320>`).  

#(2) An important thing to note here: for color and year, we have getter methods created at top of our class, but we don't have that for model. We can solve this two ways: 
    1. we use the instance variable `@model` inside the string interpolation or
    2. and that'd be better, we create a `attr_reader` (a getter) method for model at top, like this: `attr_reader :model`, so we can reference model directly as method instead of as instance variable (note that the example above goes with the first solution)

#(3) To test this, we need to instantiate a new object and then call `puts` and pass the object we've just instantiate (or any other) as argument. Remember that any time we use `puts` we are calling `to_s` on the object. Because `to_s` has been modify, the output is now different and more user friendly than the default output.
=end

#=============================

#3. When running the following code...

class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

#We get the following error...

#test.rb:9:in `<main>': undefined method `name=' for #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

#Why do we get this error and how do we fix it?

=begin
- With the line of code `bob.name = "Bob"` we are trying to change the name of the `bob` object from `"Steve"` to `"Bob"`.
- The problem is that we don't have that functionality defined in the class. We have a getter method `attr_reader`, which gives us access to *get* that data, but we don't have a setter method to *set* that data.
- To fix the problem we can either
    - create a setter method that allows us to *re-write* that information with `attr_write` for name or
    - create a setter method that allows us to read and write that data with `attr_accessor`. We will opt for this second solution.
=end

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
puts bob.name  # => Bob