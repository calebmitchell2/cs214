]0;david@davidreidsma:~/Programming/Calvin/cs214/lab10/ruby[david@davidreidsma ruby]$ ls
bird.rb  birds.rb  duck.rb  goose.rb  owl.rb
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab10/ruby[david@davidreidsma ruby]$ cat *.rb
# bird.rb | Defines a Bird superclass 
#   to be extended by specific bird sub-classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 04/25/2020
####################################################

class Bird

  attr_reader :name

  # Initialize a bird with a name.
  # Postcondition: name = name
  def initialize(name)
    @name = name
  end

  # Get the call of this bird.
  def call
    return "Squaaaaaaawk!"
  end

  # Get the class name.
  def class_name
    self.class.to_s
  end

  # Print details of this bird to the console.
  def print
    puts name + ' ' + class_name + " says \"" + call + "\""
  end

end
# birds.rb | Tests out the menagerie of bird classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 04/25/2020
######################################################

require './bird.rb'
require './duck.rb'
require './goose.rb'
require './owl.rb'

puts "\nWelcome to the Bird Park!\n\n"

bird0 = Bird.new "Hawkeye"
bird0.print

bird1 = Duck.new "Donald"
bird1.print

bird2 = Goose.new "Mother"
bird2.print

bird3 = Owl.new "Woodsey"
bird3.print

puts "\n\n"
# duck.rb | Defines the Duck class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 04/25/2020
####################################################

require './bird.rb'

class Duck < Bird

  # Get the call of this bird.
  def call
    return "Quack!"
  end

end
# goose.rb | Defines the Goose class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 04/25/2020
####################################################

require './bird.rb'

class Goose < Bird

  # Get the call of this bird.
  def call
    return "Honk!"
  end

end
# owl.rb | Defines the Owl class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 04/25/2020
####################################################

require './bird.rb'

class Owl < Bird

  # Get the call of this bird.
  def call
    return "Whoo-hoo!"
  end

end
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab10/ruby[david@davidreidsma ruby]$ ruby birds.rb

Welcome to the Bird Park!

Hawkeye Bird says "Squaaaaaaawk!"
Donald Duck says "Quack!"
Mother Goose says "Honk!"
Woodsey Owl says "Whoo-hoo!"

