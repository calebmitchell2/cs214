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
