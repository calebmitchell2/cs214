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
