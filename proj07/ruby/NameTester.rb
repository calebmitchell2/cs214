# NameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by:   David Reidsma
# Date:           04/08/2020
####################################################

require 'test/unit/assertions'   # needed for assert
include Test::Unit::Assertions

class Name
   # Initializes a name variable
   # Input: first, a first name
   # Input: middle, a middle name
   # Input: last, a last name
   def initialize(first, middle, last)
      @first, @middle, @last = first, middle, last
   end

   # Returns the full name as a string
   # Precondition: initialize has been called.
   def fullName
      return @first + ' ' + @middle + ' ' + @last
   end

   # Print the full name and return it
   # Precondition: initialize has been called
   def print
      name = fullName
      puts name
      return name
   end

   # Returns the full name in format "(last), (first) (middle initial)"
   # Precondition: initialize has been called
   def lfmi
      return @last + ", " + @first + ' ' + @middle[0]
   end

   # Reads a first, middle, and last name from the console.
   def readName
     @first = gets.chomp
     @middle = gets.chomp
     @last = gets.chomp
   end

   attr_accessor :first, :middle, :last
end

def testName
   name = Name.new("John", "Paul", "Jones")

   assert name.first == "John", "first getter failed"
   assert name.middle == "Paul", "middle getter failed"
   assert name.last == "Jones", "last getter failed"
   
   assert name.fullName == "John Paul Jones", "fullName failed"
   assert name.print == "John Paul Jones", "print failed"
   name.first = "Finn"
   assert name.first == "Finn", "first setter failed"
   name.middle = "The"
   assert name.middle == "The", "middle setter failed"
   name.last = "Human"
   assert name.last == "Human", "last setter failed"
   assert name.lfmi == "Human, Finn T", "lfmi failed"
   
   print "All tests passed!\n"
   print "Enter a first, middle, and last name, pressing enter after each:\n"
   name.readName
   puts name.fullName
end

testName
