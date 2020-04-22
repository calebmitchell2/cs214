# list_tester.rb tests a Ruby linked list.
#
# Begun by: Dr. Adams for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 04/22/2020

require './List'

list1 = List.new
list2 = List.new
list3 = List.new
list4 = List.new

list1.append(99).append(88).append(77).append(66).append(55)
list2.append(55).append(66).append(77).append(88).append(99)
list3.append(55).append(77).append(99).append(88).append(66)
list4.append(11).append(12).append(13).append(14).append(15)

list1.print 
puts
puts "Maximum of list1: #{list1.max}"
puts "Index of 99 in list1: #{list1.search(99)}"

list2.print 
puts
puts "Maximum of list2: #{list2.max}"
puts "Index of 99 in list2: #{list2.search(99)}"

list3.print 
puts
puts "Maximum of list3: #{list3.max}"
puts "Index of 99 in list3: #{list3.search(99)}"

list4.print
puts
puts "Index of 99 in list4: #{list4.search(99)}"
