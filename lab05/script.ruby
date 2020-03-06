]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05[davidreidsma@davidr-fedora lab05]$ cd ruby
]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/ruby[davidreidsma@davidr-fedora ruby]$ cat split.rb
# split.rb splits a string into two substrings.
#
# Input: A string and an integer string position to split the string by.
# Precondition: The position integer is within the range of the string size.
# Output: The substrings aString(0, position - 1) and
#   aString(pos, length() - 1).
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date:         03/06/2020
#################################################################


# split() splits a string into its two substrings.
# Receive: aString, the string to be split,       
#        pos, the split position.                  
# PRE: 0 <= pos < the length of aString.
# Return: the substring of aString before pos, and  
#         the substring of aString from pos onwards.
######################################################

def split(aString, pos)
  [aString[0, pos], aString[pos..aString.size - 1]]
end

def main
  print "To split a string, enter the string: "; 
  the_string = gets
  print "Enter the split position: "; 
  position = gets.to_i
  split_string = split(the_string, position)
  puts "The first part is: " << split_string[0]
  puts "and the second part is: " << split_string[1]
end

main
]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/ruby[davidreidsma@davidr-fedora ruby]$ ruby split.rb
To split a string, enter the string: hello
Enter the split position: 0
The first part is: 
and the second part is: hello
]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/ruby[davidreidsma@davidr-fedora ruby]$ ruby split.rb
To split a string, enter the string: hello
Enter the split position: 3
The first part is: hel
and the second part is: lo
]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/ruby[davidreidsma@davidr-fedora ruby]$ ruby split.rb
To split a string, enter the string: hello
Enter the split position: 5
The first part is: hello
and the second part is: 
]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/ruby[davidreidsma@davidr-fedora ruby]$ exit

