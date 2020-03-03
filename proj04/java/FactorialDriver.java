/**
 * FactorialDriver.java is a driver for getFactorial.
 *
 * Author: David Reidsma
 * Date:   03/02/2020
 */
import java.util.Scanner;

public class FactorialDriver {
    
    /**
     * Main function of a program that computes factorials
     */
    public static void main(String[] args) {
        System.out.print("To compute n!, enter n: ");

        Scanner scanner = new Scanner(System.in);
        int n = Integer.parseInt(scanner.next());

        FactorialDriver driver = new FactorialDriver();
        System.out.printf("%d! = %f", n, driver.getFactorial(n));
    }

    /**
     * getFactorial computes n!.
     * @param n An integer
     * @return The factorial of n
     */
    double getFactorial(int n) {
        double answer = 1.0;
        for (int i = 2; i <= n; ++i) {
            answer *= i;
        }
        return answer;
    }
}
