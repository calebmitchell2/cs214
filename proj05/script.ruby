Script started on 2020-03-11 22:20:46-0400
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05[00m$ cd ruby
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05/ruby[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05/ruby[00m$ cat quad_ro ot.ruby[K[K[K[K[K[K[K[A[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[K
[K[A[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[K[KRoo t.rb
#! /usr/bin/ruby
# quadRoot.rb is a driver for computeRoots.
#
# Author: David Reidsma
# Date:   03/11/2020

# computeRoots computes the roots of a quadratic equation.
# Input: a, a float
# Input: b, a float
# Input: c, a float
# Output: A tuple storing a boolean (true for success, false otherwise) and two numbers (the roots)
def computeRoots(a, b, c)
  if a != 0
    arg = (b ** 2.0) - (4 * a * c)
    if arg >= 0
      root1 = (-b + Math.sqrt(arg)) / (2 * a);
      root2 = (-b - Math.sqrt(arg)) / (2 * a);
      return true, root1, root2
    else
      puts "b^2 - 4ac is negative!"
      return false, 0.0, 0.0
    end
  else
    puts "a is zero!"
    return false, 0.0, 0.0
  end
end

# Main function of a program that computes quadratic roots
if __FILE__ == $0
  print "Enter a: "
  a = gets.chomp.to_f
  print "Enter b: " 
  b = gets.chomp.to_f
  print "Enter c: "
  c = gets.chomp.to_f

  success, root1, root2 = computeRoots(a, b, c)
  if success
    puts "#{root1}, #{root2}"
  end
end
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05/ruby[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05/ruby[00m$ ruby quadRo ot.rb
Enter a: 1
Enter b: 25
Enter c: 25
-1.0435607626104009, -23.9564392373896
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05/ruby[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05/ruby[00m$ ruby quadRooot.rb
Enter a: 3
Enter b: 10
Enter c: 4
-0.4648162415120036, -2.86851709182133
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05/ruby[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05/ruby[00m$ exit

Script done on 2020-03-11 22:21:14-0400
