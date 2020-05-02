Script started on 2020-05-01 23:42:40-04:00 [TERM="xterm-kitty" TTY="/dev/pts/0" COLUMNS="114" LINES="20"]
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab11[david@davidreidsma lab11]$ cd java
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab11/java[david@davidreidsma java]$ ls
ArraySum.java  Makefile  Sum.java  ThreadedArraySum.java
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab11/java[david@davidreidsma java]$ cat ThreadedArraySum.java 
/* ThreadedArraySum.java uses multiple threads to sum the integers in a file using an array.
 *
 * Usage: java -Xint ArraySum <fileName>
 *
 * Input: the name of the input file
 *         (entered on the command-line).
 * Precondition: the first line of the file is the number
 *                of (other) numbers in the file.
 * Output: the sum of the other numbers in the file
 *          and how long it took to compute that sum.
 *
 * Begun by: Prof. Adams for CS 214 at Calvin College.
 * Completed by: David Reidsma
 * Date: 05/01/2020
 */

import java.util.Scanner;                   // convenient I/O
import java.io.File;                        // file I/O
import java.io.FileNotFoundException;       // file exception
import java.lang.System;                    // nanoTime()

public class ThreadedArraySum {

    public static void main(String [] args) {
	ThreadedArraySum me = new ThreadedArraySum(args);
	me.run();
    }

    /* constructor
     * @param: args, an array of Strings
     * Precondition: args.length == 1 &&
     *                args[0] is the name of an input file
     *                 whose first line is N, an integer
     *                 followed by a blank line
     *                 followed by N integers, one per line.
     * Postcondition: myScanner is a Scanner for that input file
     *             && myArray is an array containing the N ints.
     */
    public ThreadedArraySum(String [] args) {
	if (args.length < 1) {
	    System.err.println("\n*** Usage: java Sum <fileName>\n");
	    System.exit(1);
	}
	Scanner aScanner = openScanner( args[0] ); // open input file
	myArray = readFile(aScanner);              // fill array with values
	threadCount = getThreadCount(args);
    }


    /* utility to open / return a Scanner to a file 
     *   whose name comes from the command-line.
     * 
     * @param: fileName, a String
     * Precondition: fileName is the name of an input file.
     * Return: a Scanner for that input file.
     */
    private Scanner openScanner(String fileName) {
	Scanner in = null;
	try {
	    File theFile = new File ( fileName );
	    in = new Scanner( theFile );
	} catch ( FileNotFoundException  fnfe ) {
	    System.err.println("\n*** Unable to open '" + fileName + "'\n");
	    System.exit(1);
	}

	return in;
    }

    /* fill an array with values from a Scanner
     * @param: in, a Scanner to an input file.
     * Precondition: the first line of the input file is N,
     *                the number of (other) numbers in the file.
     * Postcondition: the N int values have been read
     *                 from 'in' and stored in an array.
     * Return: the array containing the N int values.
     */
    private int[] readFile(Scanner in) {
	int numNumbers = in.nextInt();           // read how many numbers
	int [] array = new int[numNumbers];      // allocate array
	for (int i = 0; i < array.length; i++) { // fill array
	    array[i] = in.nextInt();              //   with numbers
	}
	in.close();                              // close input file
	return array;                            // we're done
    }

    /* how long does it take to process the values in myArray?
     * Precondition: myArray has been filled with N input values.
     * Output: the sum of the values in myArray
     *          and how long it took to compute that sum.
     */
    public void run() {
	long startTime = System.nanoTime();             // start timing
	long sum = sumArray(myArray);                    // sum the values
	long totalTime = System.nanoTime() - startTime; // stop timing

	System.out.println("\nThe sum of the " + myArray.length
			   + " numbers is: " + sum 
			   + "\n and summing them took " 
			   + totalTime + " time units.\n");
    }

    /* sum the values in an array
     * @param: arr, an array of integers
     * Return: the sum of the int values in arr.
     */
    private long sumArray(int[] arr) {
	Helper[] helpers = new Helper[threadCount];

	for (int i = 1; i < threadCount; ++i) {     // for each helper:
	    helpers[i] = new Helper(i);                  //  create, and
	    helpers[i].start();                          //  launch them
	}

	long sum = getSliceSum(0);                         // main thread does slice 0

	try {
	    for (int i = 1; i < threadCount; ++i) {  // for each helper h:
		helpers[i].join();                        //  wait for h to finish
		sum += helpers[i].getPartialSum();        //  get its partial sum
	    }
	} catch( InterruptedException ie) {             // required by join()
	    System.err.println("\n*** a Helper was interrupted!\n");
	    System.err.println(ie);
	    System.exit(1);
	}

	return sum;
    }

    /**
     * Get the sum of a slice.
     * @param id The id of the slice. Basically the index.
     * @return The sum of the numbers in this slice.
     */
    private long getSliceSum(int id) {
        int sliceSize = myArray.length / threadCount;
        int start = id * sliceSize;         // starting index
        int stop = (id+1) * sliceSize;      // stopping index
        if ( id == threadCount-1 ) {       // have final thread
            stop = myArray.length;            //  handle leftovers
        } 
        long sliceSum = 0;
        for (int i = start; i < stop; ++i) {  // sum the ints
            sliceSum += myArray[i];           //  in my slice
        }
        return sliceSum;
    }

    private class Helper extends Thread {
	private int id;
	private long partialSum;

	/**
	 * Create a helper thread.
	 * @param id The id of this thread.
	 * Postcondition: the id has been set and the partial sum is set to 0.
	 */
	public Helper(int id) {
	    super();
	    this.id = id;
	    partialSum = 0;
	}

	/**
	 * Run this helper thread.
	 * Postcondition: the partial sum has been updated.
	 */
	public void run() {
	    partialSum = getSliceSum(id);
	}

	/**
	 * Get the partial sum.
	 * @return the partial sum.
	 */
	public final long getPartialSum() {
	    return partialSum;
	}
    }

    /**
     * Get the number of threads to use.
     * @param args The arguments passed to the program.
     * @return The amount of threads specified by the user.
     */
    private final int getThreadCount(String[] args) {
	if (args.length >= 2)
	    return Integer.parseInt(args[1]);

	return 1;
    }

    private int [] myArray = null;
    private int threadCount = 1;
}

]0;david@davidreidsma:~/Programming/Calvin/cs214/lab11/java[david@davidreidsma java]$ javac -deprecation ThreadedArraySum.java 
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab11/java[david@davidreidsma java]$ java ThreadedArraySum ../.[Knumbers/1000000numbers.txt 

The sum of the 1000000 numbers is: 50473230
 and summing them took 5405950 time units.

]0;david@davidreidsma:~/Programming/Calvin/cs214/lab11/java[david@davidreidsma java]$ java ThreadedArraySum ../numbers/1000000numbers.txt 4

The sum of the 1000000 numbers is: 50473230
 and summing them took 12795678 time units.

]0;david@davidreidsma:~/Programming/Calvin/cs214/lab11/java[david@davidreidsma java]$ cd ..
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab11[david@davidreidsma lab11]$ exit

Script done on 2020-05-01 23:44:54-04:00 [COMMAND_EXIT_CODE="0"]
