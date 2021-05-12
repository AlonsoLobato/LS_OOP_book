# This exercise asked us to create a new class and implement some functionality in it.

class MyCar                                                 # (1)

  attr_accessor :color                                      # (6)

  attr_reader :year                                         # (7)

  def initialize(year, color, model)                        # (2)
    @year = year
    @color = color
    @model = model
    @current_speed = 0                                      # (3)
  end

  # def change_color(new_color)                             # (*)
  #   @color = new_color
  # end

  def speed_up(number)                                      # (4)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)                                         # (4)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."

  end

  def shut_off                                              # (4)
    @current_speed = 0
    puts "The car is now off"
  end

  def current_speed                                         # (4)
    puts "You are now going #{@current_speed} mph."
  end

  def spray_paint(spray_color)                              # (8)
    self.color = spray_color
    puts "The new color of your car is #{@color}."
  end

end

skoda = MyCar.new(2021, "blue", "Kamiq")                    # (5)
p skoda
skoda.current_speed
skoda.speed_up(10)
skoda.current_speed
skoda.brake(4)
skoda.current_speed
skoda.shut_off
skoda.current_speed
skoda.color = "grey"
p skoda.color
p skoda.year
skoda.spray_paint("red")
p skoda.color

=begin
#(1) Create a class called MyCar

#(2) When we initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, model and color:
This `initialize` method takes three parameter that are the arguments user can pass to the method.
Note that we assign the argument that user passes, to instance variables of the same name.

#(3) Create an instance variable that is set to `0` during instantiation of the object to track the current speed of the car:
This can be achieved by creating a new instance variable set up to a fix value, in this case `0`, so we don't allow user to define the value of this state of the object. This will also be helpful to track current speed of the car object.

#(4) Create some instance methods that allow the car to speed up, brake and shut off:
For this functionality we'll use instance methods.
Also, we include a fourth method `current_speed` to check the speed of the car.
Some of these methods take a parameter, which will update the instance variables that determine the states of the car object.
Other methods don't take parameters, but we manually update some states of the car object.
For a better user experience we will output (`puts`) some messages when we call the instance    methods, to output what happened.

#(5) Finally we have to create a new object of the `MyCar` class and invoke the different instance methods passing in the desired argument.

#(6) Add an accessor method to the class to change and view the color:
To do that we use an `attr_accessor` method that takes a symbol that reference the color state of the car object. We can now easily change the state of the color of the car by assigning a new value through `skoda.color = 'red'` 

(*) Note that we don't need to create a method for this change (although this method will work), 
the setter method does it for us in a shorter way

#(7) Add an accessor method to the class to view but not change the year:
To do that we use a `attr_reader` (that gives access to read but not to change) that takes a symbol that reference the year state of the car object.

#(8) Create a method called `spray_paint` that modifies the color of the car and creates an interface that allows us to describe it:

We have two ways to do that: 
- we can just reassign the instance variable to a new value `@color = spray_color`  
- or, because we already have a setter method, it'd a good idea to access that to modify that     particular state. To do that, we need to invoke the method we want to modify using `self`.

Note that we can already change the color as allowed by the accessor method, but the point here is to create a nice interface.
=end