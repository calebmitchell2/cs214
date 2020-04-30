# walking_bird.rb defines the behavior of a bird that walks.
# Author: David Reidsma
# Date: 04/30/2020

require './bird.rb'

class WalkingBird < Bird
  # Get the movement of this bird.
  def movement
    return "walked past"
  end
end
