kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ cat YearCodes.java
/* YearCodes.java is a driver for function yearCode().
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Finished by: David Reidsma
 * Date: 02/21/2020
 ****************************************************************/

import java.util.Scanner;

public class YearCodes {

   public static void main(String[] args) {
      Scanner keyboard = new Scanner(System.in);
      System.out.println("\nEnter your academic year: "); // prompt

      String year = keyboard.next();      // read year
      System.out.println(yearCode(year)); // display its code
   }

   /***************************************************************
    * yearCode() converts an academic year into its integer code.
    *
    * Receive: year, a string.
    * PRE: year is one of {freshman, sophomore, junior, or senior}.
    * Return: the integer code corresponding to year.
    */
    public static int yearCode(String year) {
        if (year.equalsIgnoreCase("freshman")) return 1;
        if (year.equalsIgnoreCase("sophomore")) return 2;
        if (year.equalsIgnoreCase("junior")) return 3;
        if (year.equalsIgnoreCase("senior")) return 4;
        return 0;
    }
}
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ javac -deprecation YearCodes.java
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ java YearCodes

Enter your academic year: 
freshman
1
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ java YearCodes

Enter your academic year: 
S sophomore
2
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ java YearCodes

Enter your academic year: 
Junior
3
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ java YearCodes

Enter your academic year: 
senior
4
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ java YearCodes

Enter your academic year: 
Holy Hand Grenade of Antioch
0
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ exit

