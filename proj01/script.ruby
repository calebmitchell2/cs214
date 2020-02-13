Script started on 2020-02-12 14:18:21-05:00 [TERM="screen" TTY="/dev/pts/3" COLUMNS="172" LINES="82"]
kdavidreidsma@localhost:~/Programming/Calvin/214/proj01\[davidreidsma@localhost proj01]$ cd ruby
kdavidreidsma@localhost:~/Programming/Calvin/214/proj01/ruby\[davidreidsma@localhost ruby]$ ls
rectangle_area.rb
kdavidreidsma@localhost:~/Programming/Calvin/214/proj01/ruby\[davidreidsma@localhost ruby]$ cat rectangle_area.rb 
#! /usr/bin/ruby
# rectangle_area.rb computes the area of a rectangle given a width and length
#
# Input: the width and length of a rectangle
# Precondition: the width and length must be positive
# Output: the area of the rectangle
#
# Author: David Reidsma
# Date: 11/02/2020
################################################################

# function rectangleArea returns a rectangle's area given width and length
# Parameter: width, a number; must be greater than 0
# Parameter: length, a number; must be greater than 0
# Returns: the area of rectangle whose sides are of width and length
def rectangleArea(width, length)
  width * length
end

if __FILE__ == $0
  puts "\nTo compute the area of a rectangle,"
  
  print " enter its width: "
  width = gets.chomp.to_f

  print " enter its length: "
  length = gets.chomp.to_f

  print "\nThe area is: "
  area = rectangleArea(width, length)
  puts area
end
kdavidreidsma@localhost:~/Programming/Calvin/214/proj01/ruby\[davidreidsma@localhost ruby]$ ruby rectangle_area.rb

To compute the area of a rectangle,
 enter its width: 2
 enter its length: 2

The area is: 4.0
kdavidreidsma@localhost:~/Programming/Calvin/214/proj01/ruby\[davidreidsma@localhost ruby]$ ruby rectangle_area.rb

To compute the area of a rectangle,
 enter its width: 4
 enter its length: 5

The area is: 20.0
kdavidreidsma@localhost:~/Programming/Calvin/214/proj01/ruby\[davidreidsma@localhost ruby]$ cd ..
kdavidreidsma@localhost:~/Programming/Calvin/214/proj01\[davidreidsma@localhost proj01]$ exit

Script done on 2020-02-12 14:18:58-05:00 [COMMAND_EXIT_CODE="0"]
