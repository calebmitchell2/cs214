import java.util.Scanner;
import java.util.InputMismatchException;

/*
 * Driver for the Temperature type.
 * Author: David Reidsma
 * Date: 04/15/2020
 */
class TemperatureTester {
    public static void main(String[] args) {
	System.out.println("Temperature examples:");
	System.out.println("\t20.5 C");
	System.out.println("\t10 K");
	System.out.println("\t35.1 F");
	System.out.print("Enter a start temperature: ");
	Temperature start = Temperature.readTemp();
	while (start == null) {
	    System.out.print("Invalid input, try again: ");
	    start = Temperature.readTemp();
	}
	
	System.out.print("Enter a stop temperature: ");
	Temperature stop = Temperature.readTemp();
	while (stop == null) {
	    System.out.print("Invalid input, try again: ");
	    stop = Temperature.readTemp();
	}
        
	Scanner scanner = new Scanner(System.in);
	String stepString = "";
	float step = 0;
	boolean hasStep = false;
	int i = 0;
	while (!hasStep) {
	    if (i == 0)
		System.out.print("Enter a step amount of degrees (in the same scale as your start temperature): ");
	    else
		System.out.print("Invalid input, try again: ");
	    try {
		stepString = scanner.nextLine();
		step = Float.parseFloat(stepString);
		hasStep = true;
	    } catch (NumberFormatException e) {	}
	    i++;
	}
	scanner.close();

	if (start.equals(stop)) {
	    System.out.println("Start and stop temperatures are already equal.");
	    return;
	}

	Temperature current = start;
	while (true) {
	    if (start.lessThan(stop) != current.lessThan(stop) && !current.equals(stop))
		break;

	    current.toFahrenheit().print();
	    System.out.print("\t\t");
	    current.toCelsius().print();
	    System.out.print("\t\t");
	    current.toKelvin().print();
	    System.out.println();

	    if (start.lessThan(stop))
		current = current.raise(step);
	    else
		current = current.lower(step);
	}
    }
}
