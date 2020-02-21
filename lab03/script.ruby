kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ cat s[Kyear_codes.rb
#! /usr/bin/ruby
# year_codes.rb translates an academic year into a numeric code
# Begun by: Dr. Nelesen, for CS 214 at Calvin College
# Finished by: David Reidsma
# Date: 02/21/2020 
################################################################

# Input:  The name of an academic year
# Precondition: The academic year is a string with a value of freshman, 
#   sophomore, junior or senior
# Output: The corresponding integer code for the given academic year

def yearCode(year)
   if year =~ /freshman/ then 1
   elsif year =~ /sophomore/ then 2
   elsif year =~ /junior/ then 3
   elsif year =~ /senior/ then 4
   else 0
   end
end

if __FILE__ == $0
   print "Enter the year: "
   year = gets
   print "Numeric code is: "
   puts yearCode(year)
end

kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ ruby year_codes.rb
Enter the year: freshman
Numeric code is: 1
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ ruby year_codes.rb
Enter the year: sophomore
Numeric code is: 2
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ ruby year_codes.rb
Enter the year: junior
Numeric code is: 3
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ ruby year_codes.rb
Enter the year: senior
Numeric code is: 4
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ ruby year_codes.rb
Enter the year: W thou shalt   l count to three
Numeric code is: 0
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ exit

