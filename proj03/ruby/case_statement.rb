#! /usr/bin/ruby
# case_statement.rb is a driver for letterGrade.
#
# Author: David Reidsma
# Date:   02/25/2020

# Input:        A numerical grade.
# Output:       A letter grade.
# Precondition: The input is an integer in range 0-100.
def letterGrade(average)
  case average / 10
    when 9..10 then 'A'
    when 8 then 'B'
    when 7 then 'C'
    when 6 then 'D'
  else 'F'
  end
end

# Main function of a program that allows the user to enter a numerical grade from 0-100 and then prints out the equivalent letter grade.
if __FILE__ == $0
  print "Enter your grade: "
  grade = gets
  puts letterGrade(grade.to_i)
end
