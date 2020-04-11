# Name.rb contains the Name class.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 04/10/2020
####################################################
module Names
  class Name
    def initialize(first, middle, last)
      @first, @middle, @last = first, middle, last
    end

    attr_reader :first, :middle, :last

    def fullName
      @first + " " + @middle + " " + @last
    end

    def print
      puts fullName
      fullName
    end
  end
end
