Script started on 2020-05-02 13:44:54-04:00 [TERM="xterm-kitty" TTY="/dev/pts/1" COLUMNS="84" LINES="25"]
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab11[david@davidreidsma lab11]$ cd ruby
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab11/ruby[david@davidreidsma ruby]$ ls
array_sum.rb  threaded_array_sum.rb  threaded_array_sum.rb~
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab11/ruby[david@davidreidsma ruby]$ cat threaded_array_sum.rb
# array_sum.rb sums the values in an array
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: David Reidsma
# Date: 05/02/2020
#
# Usage: ruby array_sum.rb <inFileName>
######################################################

# make certain the input file was specified on the command-line
def checkCommandLine
  if ARGV.length != 2
     puts "\nUsage: sum <fileName> <numThreads>\n\n"
     exit(1)
  end
end

# return: an array containing the values from the file
#  whose name was specified on the command-line
def readFile
   strArray = IO.readlines( ARGV[0] )
   intArray = Array.new( Integer(strArray[0]) )
   for i in 2..strArray.size
      if  !strArray[i].nil?
         intArray[i-2] = Integer( strArray[i].chomp )
      end
   end
   intArray 
end

# Return: the sum of the values in a slice
def sumSlice(values, id, sliceSize)
  start = id * sliceSize
  stop = start + sliceSize - 1
  myTotal = 0
  for i in start..stop
    myTotal += values[i]
  end
  myTotal
end

# Sum the numbers of an array in parallel.
# Params: values - the array
#         numThreads - the number of threads to use
# Return: the sum of the values
def sumInParallel(values, numThreads)
  sliceSize = values.size / numThreads
  threadArray = Array.new( numThreads )
  result = 0
  lock = Mutex.new

  (1..numThreads-1).each do | i |
    threadArray[i] = Thread.new { 
      myTotal = sumSlice(values, 
                         i,
                         sliceSize) 
      lock.synchronize {
        result += myTotal
      }
    }
  end

  myTotal  = sumSlice(values, 0, sliceSize)

  leftovers = values.size % numThreads
  if leftovers > 0
    for i in values.size-leftovers..values.size-1
      myTotal += values[i]
    end
  end

  lock.synchronize {
    result += myTotal
  }

  for i in 1..numThreads-1
    threadArray[i].join
  end

  result
end

def main
   checkCommandLine
   values = readFile
   startTime = Time.now
   total = sumInParallel(values, Integer(ARGV[1]))
   endTime = Time.now
   interval = (endTime - startTime).to_f
   puts "\nThe sum is #{total}\n"
   printf(" and computing it took %.9f seconds.\n\n", interval)
end

main

]0;david@davidreidsma:~/Programming/Calvin/cs214/lab11/ruby[david@davidreidsma ruby]$ ruby threaded_array_sum.rb ../numbers/1000000numbers.txt  [A[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[K
[K[A[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C  1

The sum is 50473230
 and computing it took 0.065894218 seconds.

]0;david@davidreidsma:~/Programming/Calvin/cs214/lab11/ruby[david@davidreidsma ruby]$ p[Kruby threaded_array_sum.rb ../numbers/1000000numbers.txt 1[A[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C
[C[K[A[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[K
[K[A[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[C[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab11/ruby[david@davidreidsma ruby]$ ruby threaded_array_sum.rb ../numbers/1000000numbers.txt 1[K4

The sum is 50473230
 and computing it took 0.063921374 seconds.

]0;david@davidreidsma:~/Programming/Calvin/cs214/lab11/ruby[david@davidreidsma ruby]$ cd ..
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab11[david@davidreidsma lab11]$ exit

Script done on 2020-05-02 13:47:12-04:00 [COMMAND_EXIT_CODE="0"]
