Script started on 2020-02-06 13:27:50-0500
dar23@gold14:~/cs214$ cat circle_area.rb
#! /usr/bin/ruby
# circle_area.rb computes the area of a circle given its radius
# 
# Input: the radius of a circle
# Precondition: the radius is not negative
# Output: the area of the circle.
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 06/02/2020
###############################################################

# function circleArea returns a circle's area, given its radius
# Parameters: r, a number
# Precondition: r > 0.
# Returns: the area of a circle whose radius is r.
PI = 3.1415927 # Pi constant
def circleArea(r) # function definition
    PI * r ** 2 # area calculation
end # end block

if __FILE__ == $0 # only run when this is the file being run
   puts "To compute the area of a circle," # print with \n
   print " enter its radius: " # print
   radius = gets.chomp.to_f # get input and cast it to a float and store it in a variable radius
   print "The circle's area is: " # print
   puts circleArea(radius) # print with \n
end # end block
dar23@gold14:~/cs214$ ruby s circle_area.rb
To compute the area of a circle,
 enter its radius: 1
The circle's area is: 3.1415927
dar23@gold14:~/cs214$ ruby circle_area.rb
To compute the area of a circle,
 enter its radius: 2
The circle's area is: 12.5663708
dar23@gold14:~/cs214$ ruby circle_area.rb
To compute the area of a circle,
 enter its radius: 2.5
The circle's area is: 19.634954375
dar23@gold14:~/cs214$ ruby circle_area.rb
To compute the area of a circle,
 enter its radius: 4.99999
The circle's area is: 78.53950334104417
dar23@gold14:~/cs214$ exit

Script done on 2020-02-06 13:28:28-0500
