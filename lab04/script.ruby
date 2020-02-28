kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab04\[davidreidsma@davidr-fedora lab04]$ cd ruby
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab04/ruby\[davidreidsma@davidr-fedora ruby]$ cat logTable.rb 
#! /usr/bin/ruby
# logTable.rb displays a table of logarithms
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
#
# Input:  The start, stop and increment values
# Precondition: The start value is less than the stop value, 
#     and the increment is greater than 0
# Output: A table of logarithms from start to stop, with increment
#     as the step value


if __FILE__ == $0
   print "Enter the start value: "
   start = gets.chomp.to_f
   print "Enter the stop value: "
   stop = gets.chomp.to_f
   print "Enter the increment value: "
   increment = gets.chomp.to_f

   count = start
   while count <= stop
      puts "The logarithm of #{count} is #{Math.log10(count)}"
      count += increment
   end
end

kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab04/ruby\[davidreidsma@davidr-fedora ruby]$ ruby logTable.rb
Enter the start value: 1
Enter the stop value: 2
Enter the increment value: 0.5
The logarithm of 1.0 is 0.0
The logarithm of 1.5 is 0.17609125905568124
The logarithm of 2.0 is 0.3010299956639812
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab04/ruby\[davidreidsma@davidr-fedora ruby]$ exit

