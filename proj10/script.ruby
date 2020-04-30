Script started on 2020-04-30 00:53:03-04:00 [TERM="xterm-kitty" TTY="/dev/pts/0" COLUMNS="56" LINES="30"]
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10[david@davidreidsma proj10]$ cd ruby
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10/ruby[david@davidreidsma ruby]$ ls
bird.rb         flying_bird.rb~  owl.rb
bird.rb~        goose.rb         owl.rb~
birds.rb        goose.rb~        penguin.rb
birds.rb~       kiwi.rb          penguin.rb~
duck.rb         kiwi.rb~         script.ruby
duck.rb~        ostrich.rb       walking_bird.rb
flying_bird.rb  ostrich.rb~      walking_bird.rb~
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10/ruby[david@davidreidsma ruby]$ cat *.rb
# bird.rb | Defines a Bird superclass 
#   to be extended by specific bird sub-classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 04/30/2020
####################################################

class Bird

  attr_reader :name

  # Initialize a bird with a name.
  # Postcondition: name = name
  def initialize(name)
    @name = name
  end

  # Get the class name.
  def class_name
    self.class.to_s
  end

  # Print details of this bird to the console.
  def print
    puts "#{name} #{class_name} just #{movement} and said, \"#{call}\""
  end

end
# birds.rb | Tests out the menagerie of bird classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 04/30/2020
######################################################

require './duck.rb'
require './goose.rb'
require './owl.rb'
require './penguin.rb'
require './ostrich.rb'
require './kiwi.rb'

puts "\nWelcome to the Bird Park!\n\n"

bird1 = Duck.new "Donald"
bird1.print

bird2 = Goose.new "Mother"
bird2.print

bird3 = Owl.new "Woodsey"
bird3.print

bird4 = Penguin.new "Tux"
bird4.print

bird5 = Ostrich.new "Kenny"
bird5.print

bird6 = Kiwi.new "Robert"
bird6.print

puts "\n\n"
# duck.rb | Defines the Duck class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 04/30/2020
####################################################

require './flying_bird.rb'

class Duck < FlyingBird

  # Get the call of this bird.
  def call
    return "Quack!"
  end

end
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
# goose.rb | Defines the Goose class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 04/30/2020
####################################################

require './flying_bird.rb'

class Goose < FlyingBird

  # Get the call of this bird.
  def call
    return "Honk!"
  end

end
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
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10/ruby[david@davidreidsma ruby]$ ruby birds.rb

Welcome to the Bird Park!

Donald Duck just flew past and said, "Quack!"
Mother Goose just flew past and said, "Honk!"
Woodsey Owl just flew past and said, "Whoo-hoo!"
Tux Penguin just walked past and said, "Blraww!"
Kenny Ostrich just walked past and said, "Rrr Rrr Rrrrrr!"
Robert Kiwi just walked past and said, "Caw!"


]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10/ruby[david@davidreidsma ruby]$ cd ..
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10[david@davidreidsma proj10]$ exit

Script done on 2020-04-30 00:53:16-04:00 [COMMAND_EXIT_CODE="0"]
