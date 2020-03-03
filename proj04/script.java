kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04\[davidreidsma@davidr-fedora proj04]$ cd java
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04/java\[davidreidsma@davidr-fedora java]$ cat FactorialDriver.java
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
        System.out.printf("%d! = %f\n", n, driver.getFactorial(n));
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
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04/java\[davidreidsma@davidr-fedora java]$ javac -deprecation FactorialDriver.java
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04/java\[davidreidsma@davidr-fedora java]$ java FactorialDriver
To compute n!, enter n: 0
0! = 1.000000
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04/java\[davidreidsma@davidr-fedora java]$ java FactorialDriver
To compute n!, enter n: 10
10! = 3628800.000000
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04/java\[davidreidsma@davidr-fedora java]$ java FactorialDriver
To compute n!, enter n: 21
21! = 51090942171709440000.000000
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04/java\[davidreidsma@davidr-fedora java]$ exit

