# penguin.rb defines the behavior of a penguin.
# Author: David Reidsma
# Date: 04/30/2020

require './walking_bird.rb'

class Penguin < WalkingBird
  # Get the call of this bird.
  def call
    return "Blraww!"
  end
end
