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
