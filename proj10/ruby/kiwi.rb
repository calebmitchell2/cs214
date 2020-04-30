# kiwi.rb defines the behavior of a kiwi.
# Author: David Reidsma
# Date: 04/30/2020

require './walking_bird.rb'

class Kiwi < WalkingBird
  # Get the call of this bird.
  def call
    return "Caw!"
  end
end
