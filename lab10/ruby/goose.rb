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
