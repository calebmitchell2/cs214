Script started on 2020-04-09 00:07:38-04:00 [TERM="xterm-256color" TTY="/dev/pts/1" COLUMNS="189" LINES="48"]
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07[david@davidreidsma proj07]$ cd ruby
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07/ruby[david@davidreidsma ruby]$ cat NameTester.rb 
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
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07/ruby[david@davidreidsma ruby]$ /opt/ruby2.6/bin/ruby-2.6 NameTester.rb 
John Paul Jones
All tests passed!
Enter a first, middle, and last name, pressing enter after each:
David
Anthony
Reidsma
David Anthony Reidsma
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07/ruby[david@davidreidsma ruby]$ cd ..
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07[david@davidreidsma proj07]$ exit

Script done on 2020-04-09 00:08:01-04:00 [COMMAND_EXIT_CODE="0"]
