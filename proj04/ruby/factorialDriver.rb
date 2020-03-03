#! /usr/bin/ruby
# factorialDriver.rb is a driver for getFactorial.
#
# Author: David Reidsma
# Date:   03/02/2020

# Input:        n, an integer
# Output:       The factorial of n
def getFactorial(n)
  answer = 1.0
  for i in 2..n
    answer *= i
  end
  answer
end

# Main function of a program that computes factorials
if __FILE__ == $0
  print "To compute n!, enter n: "
  n = gets.chomp.to_i
  puts "!#{n} is %f" % getFactorial(n)
end
