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
