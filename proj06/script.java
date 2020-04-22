]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06[david@davidreidsma proj06]$ cd java
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/java[david@davidreidsma java]$ ls
ArrayProcessor.class  ArrayProcessor.java
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/java[david@davidreidsma java]$ ja[K[Kcat ArrayProcessor.java
/**
 * ArrayProcessor.java is a program that reads in and prints out an array.
 *
 * Author: David Reidsma
 * Date:   03/18/2020
 */
import java.util.Scanner;

public class ArrayProcessor {
    /**
     * Main function of a program that reads in an array from the user and prints it back out
     */
    public static void main(String[] args) {
        System.out.print("Enter an array size: ");

        Scanner scanner = new Scanner(System.in);
        int arraySize = Integer.parseInt(scanner.next());
        double[] array = new double[arraySize];

        readArray(scanner, array);
        printArray(array);
        System.out.println();
    }

    /**
     * readArray reads in values to an array.
     * @param scanner A scanner to get values from
     * @param array An array to fill
     */
    static void readArray(Scanner scanner, double[] array) {
        for (int i = 0; i < array.length; i++) {
            System.out.printf("Enter value #%d: ", i + 1);
            array[i] = Double.parseDouble(scanner.next());
        }
    }

    /**
     * printArray prints out the values of an array.
     * @param array An array to print
     */
    static void printArray(double[] array) {
        for (int i = 0; i < array.length; i++) {
            System.out.printf("%f ", array[i]);
        }
    }
}
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/java[david@davidreidsma java]$ javac -deprecation J[KArrayProcessor.java
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/java[david@davidreidsma java]$ java ArrayProcessor
Enter an array size: 3
Enter value #1: 44.2
Enter value #2: -1
Enter value #3: 5.6
44.200000 -1.000000 5.600000 
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/java[david@davidreidsma java]$ cd ..
