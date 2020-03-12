Script started on 2020-03-12 16:00:14-0400
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/lab06[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/lab06[00m$ cd java
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/lab06/java[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/lab06/java[00m$ cat Average.java
/* Average.java is a driver for method avg().
 *
 * Started by: Prof. Adams, for CS 214 at Calvin College
 *
 * Student Name: 	David Reidsma
 * Date:			03/12/2020
 *
 * Precondition: array, is an array of double values.
 * Output: the average of the numbers in array.
 ***************************************************************/

import java.io.*;

public class Average {
	public static void main(String[] args) {
		double[] array0 = new double[0];
		double[] array1 = { 9.0, 8.0, 7.0, 6.0 };

		// output the average of the values in the arrays
		System.out.println("The first average is " + avg(array0));
		System.out.println("The second average is " + avg(array1));
	}

	/*
	 * sum() is a method that computes the sum of all the values in an array of doubles.
	 * Receive: array, an array of doubles.
	 * Return: the sum of the values in array.
	 ************************************************************/
	static double sum(double[] array) {
		double total = 0.0;
		for (int i = 0; i < array.length; i++) {
			total += array[i];
		}
		return total;
	}

	/*
	 * avg() is a method that computes the average of the values in an array.
	 * Receive: array, an array of doubles.
	 * Return: the average of the values in array.
	 **************************************************************/
	static double avg(double array[]) {
		if (array == null || array.length <= 0)
			return 0.0;
		
		return sum(array) / array.length;
	}
}
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/lab06/java[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/lab06/java[00m$ javac -deprecation Average.java 
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/lab06/java[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/lab06/java[00m$ a[Kjava Average
The first average is 0.0
The second average is 7.5
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/lab06/java[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/lab06/java[00m$ cd ..[K[K[K[K[Kexit

Script done on 2020-03-12 16:00:30-0400
