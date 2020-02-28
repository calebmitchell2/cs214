kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab04\[davidreidsma@davidr-fedora lab04]$ cd java
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab04/java\[davidreidsma@davidr-fedora java]$ cat LogTable.java
/* LogTable.java displays a table of logarithms.
 *
 * Input: start, stop and increment, three doubles.
 * PRE: start < stop && increment > 0.
 * Output: A table of logarithms from start to stop,
 *         with increment as the step value.
 * Begun by: Nelesen, for CS 214 at Calvin College.
 * Completed by: David Reidsma
 ********************************************************/
import java.util.Scanner; 		// Get input

class LogTable{

  public static void main(String[] args){
    Scanner keyboard = new Scanner(System.in);
    System.out.println("To display a table of logarithms,");
    System.out.println("enter the start, stop and increment values: ");
    double start, stop, increment;
    start = keyboard.nextDouble();
    stop = keyboard.nextDouble();
    increment = keyboard.nextDouble();

    double counter = start;
    while (counter <= stop) {   
        double log = Math.log10(counter);
        System.out.println("The logarithm of " + counter + " is " + log);
        counter += increment;
    }
  }
}

kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab04/java\[davidreidsma@davidr-fedora java]$ javac -deprecation LogTable.java
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab04/java\[davidreidsma@davidr-fedora java]$ java LogTable
To display a table of logarithms,
enter the start, stop and increment values: 
0 1
2
0.5
The logarithm of 1.0 is 0.0
The logarithm of 1.5 is 0.17609125905568124
The logarithm of 2.0 is 0.3010299956639812
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab04/java\[davidreidsma@davidr-fedora java]$ exit

