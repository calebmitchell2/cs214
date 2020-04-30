# owl.rb | Defines the Owl class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 04/30/2020
####################################################

require './flying_bird.rb'

class Owl < FlyingBird

  # Get the call of this bird.
  def call
    return "Whoo-hoo!"
  end

end
