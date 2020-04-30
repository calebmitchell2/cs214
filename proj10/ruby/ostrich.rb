# ostrich.rb defines the behavior of an ostrich.
# Author: David Reidsma
# Date: 04/30/2020

require './walking_bird.rb'

class Ostrich < WalkingBird
  # Get the call of this bird.
  def call
    return "Rrr Rrr Rrrrrr!"
  end
end
