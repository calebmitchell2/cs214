/**
 * RectangleArea.java computes the area of a rectangle.
 *
 * Input: The width and length of a rectangle.
 * Precondition: The width and length are positive numbers.
 * Output: The area of the rectangle.
 *
 * Author: David Reidsma
 * Date: 11/02/2020
 **********************************************************/

import java.util.Scanner;

public class RectangleArea {
	/**
	 * Returns the area of a rectangle.
	 * @param width	The width of the rectangle. Must be positive.
	 * @param length The length of the rectangle. Must be greater than one.
	 * @return The area of the rectangle.
	 */
	private static double rectangleArea(double width, double length) {
		return width * length;
	}

	public static void main(String[] args) {
		System.out.println("\nTo compute the area of a rectangle,");
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.print(" enter a width: ");
		double width = scanner.nextDouble();

		System.out.print(" enter a length: ");
		double length = scanner.nextDouble();

		double area = rectangleArea(width, length);
		System.out.println("\nThe area is " + area);
	}
}
