#! /usr/bin/ruby
# quadRoot.rb is a driver for computeRoots.
#
# Author: David Reidsma
# Date:   03/11/2020

# computeRoots computes the roots of a quadratic equation
# Input: a, a float
# Input: b, a float
# Input: c, a float
# Input: root1, a float to store the first root
# Input: root2, a float to store the second root
# Output: True if successful, false if not
def computeRoots(a, b, c, root1, root2)
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
