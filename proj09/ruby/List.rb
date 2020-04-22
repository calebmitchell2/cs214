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

