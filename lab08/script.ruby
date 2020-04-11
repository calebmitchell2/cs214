]0;david@davidreidsma:~/Programming/Calvin/cs214/lab08[david@davidreidsma lab08]$ cd ruby
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab08/ruby[david@davidreidsma ruby]$ ls
Name.rb  Name.rb~  nameTester.rb  nameTester.rb~
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab08/ruby[david@davidreidsma ruby]$ cat Name.rb nameTester.rb
# Name.rb contains the Name class.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 04/10/2020
####################################################
module Names
  class Name
    def initialize(first, middle, last)
      @first, @middle, @last = first, middle, last
    end

    attr_reader :first, :middle, :last

    def fullName
      @first + " " + @middle + " " + @last
    end

    def print
      puts fullName
      fullName
    end
  end
end
# nameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 04/10/2020
####################################################
require './Name'
require 'test/unit/assertions'
include Test::Unit::Assertions

def testName
   name = Names::Name.new("John", "Paul", "Jones")

   assert name.first == "John", 
           "first failed"
   assert name.middle == "Paul",
           "middle failed"
   assert name.last == "Jones",
           "last failed"
   assert name.fullName == "John Paul Jones",
           "fullName failed"
   assert name.print == "John Paul Jones",
           "print failed"
   
   print "All tests passed!\n"
end

testName

]0;david@davidreidsma:~/Programming/Calvin/cs214/lab08/ruby[david@davidreidsma ruby]$ ruby nameTester.rb
John Paul Jones
All tests passed!
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab08/ruby[david@davidreidsma ruby]$ cd ..


