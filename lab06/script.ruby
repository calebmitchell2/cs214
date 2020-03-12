Script started on 2020-03-12 16:01:19-0400
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/lab06[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/lab06[00m$ cd ruby
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/lab06/ruby[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/lab06/ruby[00m$ cat average.rb 
# average.rb averages the values of an array of doubles.
# Precondition: array is an array of numbers
# Output: the average of the values in array
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by:   David Reidsma
# Date:           03/12/2020
########################################################

###############################################
# sum() sums the values in an array
# Receive: array, an array of numbers
# Return: the sum of the values in array.
################################################
def sum(array)
   total = 0.0
   array.each { |num| total += num }
   return total
end

###############################################
# avg() is a method that computes the average of the values in an array.
# Receive: array, an array of doubles.
# Return: the average of the values in array.
###############################################
def average(array)
  if array.size <= 0
     return 0.0
  end
  return sum(array) / array.size
end

def main
   # Define array0 as an Array containing no values
   array0 = Array.new(0)
   # Define array1 as an Array containing 9.0, 8.0, 7.0, 6.0
   array1 = [ 9.0, 8.0, 7.0, 6.0 ]

   puts "sum 0 is: #{ sum(array0) }\n"
   puts "sum 1 is: #{ sum(array1) }\n"

   puts "average 0 is: #{ average(array0) }\n"
   puts "average 1 is: #{ average(array1) }\n"
end

main

]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/lab06/ruby[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/lab06/ruby[00m$ ruby average.rb 
sum 0 is: 0.0
sum 1 is: 30.0
average 0 is: 0.0
average 1 is: 7.5
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/lab06/ruby[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/lab06/ruby[00m$ exit

Script done on 2020-03-12 16:01:27-0400
