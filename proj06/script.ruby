]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06[david@davidreidsma proj06]$ cd ruby
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/ruby[david@davidreidsma ruby]$ ls
array_processor.rb
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/ruby[david@davidreidsma ruby]$ cat array_processor.rb
#! /usr/bin/ruby
# array_processor.rb is a program that reads in and prints out an array.
#
# Author: David Reidsma
# Date:   03/18/2020

# read_array reads in an array.
# Input: arr, an array to fill with values
def read_array(array)
  for i in 0..array.size - 1 do
    print "Enter value ##{ i + 1 }: "
    array[i] = gets.chomp.to_f
  end
end

# print_array prints out the values of an array.
# Input: arr, an array to print
def print_array(array)
  for i in 0..array.size - 1 do
    print "#{array[i]} "
  end
end

# Main function of a program that reads in an array from the user and prints it back out
if __FILE__ == $0
  print "Enter an array size: ";
  array_size = gets.chomp.to_i
  array = Array.new(array_size)
  read_array(array)
  print_array(array)
  puts ""
end
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/ruby[david@davidreidsma ruby]$ ruby array_processor
[1mTraceback[m (most recent call last):
ruby: [1mNo such file or directory -- array_processor ([1;4mLoadError[m[1m)[m
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/ruby[david@davidreidsma ruby]$ ruby array_processor.rb
Enter an array size: 3
Enter value #1: 44.2
Enter value #2: -1
Enter value #3: 5.6
44.2 -1.0 5.6 
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/ruby[david@davidreidsma ruby]$ cd ..
