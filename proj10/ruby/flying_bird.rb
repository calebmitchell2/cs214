# flying_bird.rb defines the behavior of a bird that flies.
# Author: David Reidsma
# Date: 04/30/2020

require './bird.rb'

class FlyingBird < Bird
  # Get the movement of this bird.
  def movement
    return "flew past"
  end
end
