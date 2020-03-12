Script started on 2020-03-12 15:45:17-0400
[1m[7m%[27m[1m[0m                                                                                                                                            ]2;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/lab06]1;..n/cs214/lab06[0m[27m[24m[J[01;32m➜  [36mlab06[00m [01;34mgit:([31mmaster[34m) [33m✗[00m [K[?1h=[?2004h[4mc[24m[24m[32mc[32md[39m [4mr[24m[4mr[4mu[24m[4mu[4mb[24m[4mb[4my[24m[?1l>[?2004l
]2;cd ruby]1;cd[1m[7m%[27m[1m[0m                                                                                                                                            ]2;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/lab06/ruby]1;..14/lab06/ruby[0m[27m[24m[J[01;32m➜  [36mruby[00m [01;34mgit:([31mmaster[34m) [33m✗[00m [K[?1h=[?2004h[1m[31mc[0m[39m[1m[31mc[1m[31ma[0m[39m[0m[32mc[0m[32ma[32mt[39m [4maverage.rb[24m[1m [0m[0m [?1l>[?2004l
]2;cat average.rb]1;cat# average.rb averages the values of an array of doubles.
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

[1m[7m%[27m[1m[0m                                                                                                                                            ]2;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/lab06/ruby]1;..14/lab06/ruby[0m[27m[24m[J[01;32m➜  [36mruby[00m [01;34mgit:([31mmaster[34m) [33m✗[00m [K[?1h=[?2004h[1m[31mc[0m[39m[1m[31mc[1m[31mu[0m[39m[1m[31mc[1m[31mu[1m[31mb[0m[39m[1m[31mc[1m[31mu[0m[39m[0m[39m [1m[31mc[0m[39m[0m[39m [0m[39m [32mr[39m[1m[31mr[1m[31mu[0m[39m[1m[31mr[1m[31mu[1m[31mb[0m[39m[0m[32mr[0m[32mu[0m[32mb[32my[39m [4maverage.rb[24m[1m [0m[0m [?1l>[?2004l
]2;ruby average.rb]1;rubysum 0 is: 0.0
sum 1 is: 30.0
average 0 is: 0.0
average 1 is: 7.5
[1m[7m%[27m[1m[0m                                                                                                                                            ]2;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/lab06/ruby]1;..14/lab06/ruby[0m[27m[24m[J[01;32m➜  [36mruby[00m [01;34mgit:([31mmaster[34m) [33m✗[00m [K[?1h=[?2004h[?2004l

Script done on 2020-03-12 15:45:37-0400
