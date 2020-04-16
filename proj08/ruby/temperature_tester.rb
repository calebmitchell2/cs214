require './temperature'

# Driver for the Temperature class.
# Author: David Reidsma
# Date: 04/15/2020
def main
  puts "Temperature examples:"
  puts "\t20.5 C"
  puts "\t10 K"
  puts "\t35.1 F"
  print "Enter a start temperature: "
  start, error = Temperatures::Temperature.read_temp
  while error
    print "Invalid input, try again: "
    start, error = Temperatures::Temperature.read_temp
  end

  print "Enter a stop temperature: "
  stop, error = Temperatures::Temperature.read_temp
  while error
    print "Invalid input, try again: "
    stop, error = Temperatures::Temperature.read_temp
  end
  
  print "Enter a step amount of degrees (in the same scale as your start temperature): "
  step_string = gets.chomp
  step = 0.0
  while not Temperatures::Temperature.is_numeric(step_string)
    print "Invalid input, try again: "
    step_string = gets.chomp
  end
  step = step_string.to_f

  if start.equals(stop)
    puts("Start and stop temperatures are already equal.")
    return
  end
  
  current = start
  while true
    if start.less_than(stop) != current.less_than(stop) && !current.equals(stop)
      break
    end

    current.to_fahrenheit.print_temp
    print "\t\t"
    current.to_celsius.print_temp
    print "\t\t"
    current.to_kelvin.print_temp
    puts ""

    if start.less_than(stop)
      current = current.raise(step)
    else
      current = current.lower(step)
    end
  end
end

main
