Script started on 2020-02-06 12:47:43-0500
dar23@gold14:~/cs214$ cat CircleArea.java
/* CircleArea.java computes the area of a circle.
 *
 * Input: The radius of the circle.
 * Precondition: The radius is a positive number.
 * Output: The area of the circle.
 *
 * Begun by: Dr. Adams, for CS 214, at Calvin College.
 * Completed by: David Reidsma
 * Date: 06/02/2020
 **********************************************************/


import java.util.Scanner;  // include class for Scanner

public class CircleArea {

     /* function circleArea() computes a circle's area, given its radius.
      * Parameter: r, a double
      * Precondition: r is not negative.
      * Returns: the area of the circle
      */
     public static double circleArea(double r) {
        return Math.PI * r * r;               // return an expression
     } // circleArea method
	
  // main program
  public static void main(String[] args) {
      // prompt for radius
      System.out.println("\n\nTo compute the area of a circle,");
      System.out.print(" enter its radius: ");

      // Create a connection named keyboard to standard in
      Scanner keyboard = new Scanner(System.in);

      //Get the number from the user
      double radius = keyboard.nextDouble();

      // output area
      System.out.println("\nThe area is " + circleArea(radius) + "\n");
      System.out.printf("The area is %f\n\n", circleArea(radius));
      System.out.printf("The area is %.15f\n\n", circleArea(radius));
  } // main method

} // class CircleArea
dar23@gold14:~/cs214$ javac d-  -deprecation CircleArea.java
dar23@gold14:~/cs214$ java CircleArea


To compute the area of a circle,
 enter its radius: 1

The area is 3.141592653589793

The area is 3.141593

The area is 3.141592653589793

dar23@gold14:~/cs214$ java CircleArea


To compute the area of a circle,
 enter its radius: 2

The area is 12.566370614359172

The area is 12.566371

The area is 12.566370614359172

dar23@gold14:~/cs214$ java CircleArea


To compute the area of a circle,
 enter its radius: 2.5

The area is 19.634954084936208

The area is 19.634954

The area is 19.634954084936208

dar23@gold14:~/cs214$ java CircleArea


To compute the area of a circle,
 enter its radius: 4.99999

The area is 78.53950218079365

The area is 78.539502

The area is 78.539502180793650

dar23@gold14:~/cs214$ exit

Script done on 2020-02-06 12:48:16-0500
