# This module's purpose is to contain the Temperature class.
# Author: David Reidsma
# Date: 04/15/2020
module Temperatures
  # This class represents a temperature at a given value and scale.
  class Temperature
    CELSIUS = "C"
    FAHRENHEIT = "F"
    KELVIN = "K"
    ABSOLUTE_ZERO = -273.15

    # Create a temperature with a specific value and scale.
    # @param [Float] value The numeric value.
    # @param [String] scale The scale. Valid options are: C,c,F,f,K,k
    def initialize(value, scale)
      if not Temperature.is_scale_valid(scale)
        puts "Invalid scale provided."
      end
      @value, @scale = value, scale.upcase
    end

    attr_accessor :value, :scale

    # Get a new Temperature that is equal to this one, but in Celsius.
    # @return A new Temperature.
    def to_celsius
      if @scale == KELVIN
        return Temperature.new(@value + ABSOLUTE_ZERO, CELSIUS)
      elsif @scale == FAHRENHEIT
        return Temperature.new((@value - 32) * 5.0 / 9.0, CELSIUS)
      else
        return self
      end
    end

    # Get a new Temperature that is equal to this one, but in Fahrenheit.
    # @return A new Temperature.
    def to_fahrenheit
      if @scale == KELVIN
        return Temperature.new(((@value + ABSOLUTE_ZERO) * 9.0 / 5.0) + 32, FAHRENHEIT)
      elsif @scale == CELSIUS
        return Temperature.new((@value * 9.0 / 5.0) + 32, FAHRENHEIT)
      else
        return self
      end
    end
    
    # Get a new Temperature that is equal to this one, but in Kelvin.
    # @return A new Temperature.
    def to_kelvin
      if @scale == CELSIUS
        return Temperature.new(@value - ABSOLUTE_ZERO, KELVIN)
      elsif @scale == FAHRENHEIT
        return Temperature.new((@value - 32) * 5.0 / 9.0 - ABSOLUTE_ZERO, KELVIN)
      else
        return self
      end
    end

    # Read a temperature in from the terminal. Input must be in the format "(value) (s)" where (value) is a numeric value and where (s) is the scale. The scale is one of: C,c,F,f,K,k.
    # @return A tuple containing [0] a new Temperature or nil if an error occured and [1] a boolean indicating [true] if an error occured or [false] if not.
    def self.read_temp
      input = gets.chomp
      parts = input.split(" ")
      if parts.length() != 2
        return nil, true
      end
      
      scale = parts[1][0]

      if not Temperature.is_scale_valid(scale) or not Temperature.is_numeric(parts[0])
        return nil, true
      end
      
      value = parts[0].to_f
      
      return Temperature.new(value, scale), false
    end

    # Print this Temperature to the command line.
    def print_temp
      print to_string
    end

    # @return A string representation of this Temperature.
    def to_string
      return ("%.3f" % @value).to_s.ljust(8) + " " + @scale
    end

    # Get a new Temperature with a raised value.
    # @param [Float] amount The amount to degrees to add.
    # @return A new Temperature object with a raised value.
    def raise(amount)
      return Temperature.new(@value + amount, scale)
    end

    # Get a new Temperature with a lowered value.
    # @param [Float] amount The amount of degrees to subtract.
    # @return A new Temperature object with a lowered value.
    def lower(amount)
      return Temperature.new(@value - amount, scale)
    end

    # Check if this Temperature is equal to another.
    # @param [Temperature] temp A Temperature object to compare with.
    # @return [true] if equal, [false] otherwise
    def equals(temp)
      return @value == Temperature.convert_temp(temp, @scale).value
    end

    # Check if this Temperature is less than to another.
    # @param [Temperature] temp A Temperature object to compare with.
    # @return [true] if less than, [false] otherwise
    def less_than(temp)
      return @value < Temperature.convert_temp(temp, @scale).value
    end

    # Convert a Temperature object to another scale.
    # @param [Temperature] temp A Temperature object.
    # @param [String] scale The scale to convert to.
    # @return A new Temperature object converted to a different scale, or the same object that was passed in if no conversion was necessary.
    def self.convert_temp(temp, scale)
      if temp.scale == scale
        return temp
      end

      if scale == CELSIUS
        return temp.to_celsius
      elsif scale == KELVIN
        return temp.to_kelvin
      else
        return temp.to_fahrenheit
      end
    end

    # Check if a string is a valid scale value.
    # @param [String] scale The string to check.
    # @return [true] if the scale string is one of C,c,F,f,K,k; [false] otherwise.
    def self.is_scale_valid(scale)
      upper_cased = scale.upcase
      return upper_cased == CELSIUS ||
        upper_cased == FAHRENHEIT ||
        upper_cased == KELVIN
    end

    # Check if a string is numeric.
    # Pulled nearly verbatim from: http://rosettacode.org/wiki/Determine_if_a_string_is_numeric#Ruby
    # @param [String] value The string to check.
    # @return [true] if numeric, [false] otherwise
    def self.is_numeric(value)
      begin
        Float(value)
      rescue
        false
      else
        true
      end
    end
  end
end
