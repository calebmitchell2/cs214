Script started on 2020-04-22 19:42:51-04:00 [TERM="xterm-kitty" TTY="/dev/pts/0" COLUMNS="56" LINES="51"]
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj09[david@davidreidsma proj09]$ cd ruby
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj09/ruby[david@davidreidsma ruby]$ ls
List.rb  List.rb~  list_tester.rb  list_tester.rb~
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj09/ruby[david@davidreidsma ruby]$ cat List.rb list_tester.rb
# List.rb implements a linked list structure in Ruby.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 04/22/2020
#######################################################

require 'test/unit/assertions'
include Test::Unit::Assertions

class List

  # initialize a List to be empty
  # Postcondition: first == nil and last == nil and length == 0
  def initialize
    @first = nil
    @last = nil
    @length = 0
  end

  # create reader method for length
  attr_reader :length

  # Am I empty?
  # Return: length == 0
  def empty?
    @length == 0
  end
  
  # append a value to me
  # Receive: value, the item to be appended
  # Postcondition: my last item is value and
  #                 my length is one more than it was
  def append(value)
    newNode = Node.new(value, nil)

    if empty?
      @first = newNode
    else
      @last.next = newNode      
    end

    @last = newNode
    @length += 1
    self
  end

  # print my items
  # Postcondition: my items have been displayed to the screen
  def print
    temp = @first
    while !temp.nil?
      printf "#{temp.value} "
      temp = temp.next
    end
  end

  # find my maximum item
  # Return: my maximum item
  def max
    temp = @first
    max_value = @first.value
    while !temp.nil?
      if temp.value > max_value
        max_value = temp.value
      end
      temp = temp.next
    end
    return max_value
  end

  # Search for a value in this list.
  # Receive: value, the item to be searched for
  # Return: the index of the value in this list or -1.
  def search(value)
    temp = @first
    index = 0
    while !temp.nil?
      if temp.value == value
        return index
      end
      temp = temp.next
      index += 1
    end
    return -1
  end
    
  # Replace this line with a declaration for class Node
  #  (and its methods)
  class Node
    def initialize(item, link)
      @value = item
      @next = link
    end

    attr_reader :value
    attr_accessor :next
  end
end

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
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj09/ruby[david@davidreidsma ruby]$ ruby list_tester[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K/opt/bin/[K[K[K[Kruby2.6/bin/ruby [K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[Kruby listTester.rb
[1mTraceback[m (most recent call last):
ruby: [1mNo such file or directory -- listTester.rb ([1;4mLoadError[m[1m)[m
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj09/ruby[david@davidreidsma ruby]$ ruby list_tester.rb
[1mTraceback[m (most recent call last):
	5: from list_tester.rb:7:in `<main>'
	4: from /usr/lib/ruby/2.7.0/rubygems/core_ext/kernel_require.rb:92:in `require'
	3: from /usr/lib/ruby/2.7.0/rubygems/core_ext/kernel_require.rb:92:in `require'
	2: from /home/david/Programming/Calvin/cs214/proj09/ruby/List.rb:8:in `<top (required)>'
	1: from /usr/lib/ruby/2.7.0/rubygems/core_ext/kernel_require.rb:92:in `require'
/usr/lib/ruby/2.7.0/rubygems/core_ext/kernel_require.rb:92:in `require': [1mcannot load such file -- test/unit/assertions ([1;4mLoadError[m[1m)[m
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj09/ruby[david@davidreidsma ruby]$ /opt/ruby2.6/bin/ruby list_te ster.rb
99 88 77 66 55 
Maximum of list1: 99
Index of 99 in list1: 0
55 66 77 88 99 
Maximum of list2: 99
Index of 99 in list2: 4
55 77 99 88 66 
Maximum of list3: 99
Index of 99 in list3: 2
11 12 13 14 15 
Index of 99 in list4: -1
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj09/ruby[david@davidreidsma ruby]$ cd ..
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj09[david@davidreidsma proj09]$ exit

Script done on 2020-04-22 19:45:30-04:00 [COMMAND_EXIT_CODE="0"]
