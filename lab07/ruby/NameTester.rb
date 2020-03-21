# NameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by:   David Reidsma
# Date:           03/20/2020
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

   attr_reader :first, :middle, :last
end

def testName
   name = Name.new("John", "Paul", "Jones")

   assert name.first == "John", "first failed"
   assert name.middle == "Paul", "middle failed"
   assert name.last == "Jones", "last failed"
   assert name.fullName == "John Paul Jones", "fullName failed"
   assert name.print == "John Paul Jones", "print failed"
   
   print "All tests passed!\n"
end

testName

