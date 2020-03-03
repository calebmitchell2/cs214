kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04\[davidreidsma@davidr-fedora proj04]$ cd ruby
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04/ruby\[davidreidsma@davidr-fedora ruby]$ cat factorialDriver.rb
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
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04/ruby\[davidreidsma@davidr-fedora ruby]$ ruby factorialDriver.rb
To compute n!, enter n: 0
!0 is 1.000000
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04/ruby\[davidreidsma@davidr-fedora ruby]$ ruby factorialDriver.rb
To compute n!, enter n: 10
!10 is 3628800.000000
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04/ruby\[davidreidsma@davidr-fedora ruby]$ ruby factorialDriver.rb
To compute n!, enter n: 21
!21 is 51090942171709440000.000000
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04/ruby\[davidreidsma@davidr-fedora ruby]$ exit

