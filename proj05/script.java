Script started on 2020-03-11 22:14:43-0400
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05[00m$ cd java
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05/java[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05/java[00m$ cat QuadRoo t.java
/** 
 * QuadRoot.java is a driver for computeRoots.
 * Author: David Reidsma
 * Date:   03/11/2020
 */

import java.util.Scanner;

public class QuadRoot {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter a: ");
        double a = scanner.nextDouble();

        System.out.print("Enter b: ");
        double b = scanner.nextDouble();

        System.out.print("Enter c: ");
        double c = scanner.nextDouble();

        double[] roots = new double[2];
        if (computeRoots(a, b, c, roots))
            System.out.printf("%f, %f\n", roots[0], roots[1]);

        scanner.close();
    }

    /**
     * computeRoots computes the roots of a quadratic equation.
     * @param a The a variable
     * @param b The b variable
     * @param c The c variable
     * @param roots An array to store the two roots
     * @return True if successful, false if not
     */
    static boolean computeRoots(double a, double b, double c, double[] roots) {
        if (a != 0) {
            double arg = Math.pow(b, 2.0) - 4 * a * c;
            if (arg >= 0) {
               roots[0] = (-b + Math.sqrt(arg)) / (2 * a);
               roots[1] = (-b - Math.sqrt(arg)) / (2 * a);
               return true;
            } else {
               System.out.println("b^2 - 4ac is negative!");
               roots[0] = roots[1] = 0.0;
               return false;
            }
         } else {
            System.out.println("a is zero!");
            roots[0] = roots[1] = 0.0;
            return false;
         }
    }
}
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05/java[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05/java[00m$ javac -depr ecation J[KJ[KQuadRoot.java
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05/java[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05/java[00m$ java QuadRo ot
Enter a: 1
Enter b: 25
Enter c: 25
-1.043561, -23.956439
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05/java[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05/java[00m$ java QuadRooot
Enter a: 3
Enter b: 10
Enter c: 4
-0.464816, -2.868517
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05/java[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05/java[00m$ exit

Script done on 2020-03-11 22:15:49-0400
