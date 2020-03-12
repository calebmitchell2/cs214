/** 
 * quad_root.java is a driver for computeRoots.
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
            System.out.printf("%f, %f", roots[0], roots[1]);

        scanner.close();
    }

    /**
     * computeRoots computes the roots of a quadratic equation.
     * @param a
     * @param b
     * @param c
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
