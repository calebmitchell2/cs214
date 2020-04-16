import java.lang.Character;
import java.lang.Float;
import java.util.Scanner;

/*
 * This class represents a temperature at a given value and scale.
 * Author: David Reidsma
 * Date: 04/13/2020
 */
class Temperature {
    private char scale;
    private double value;

    private static final char KELVIN = 'K';
    private static final char CELSIUS = 'C';
    private static final char FAHRENHEIT = 'F';

    private static final float ABSOLUTE_ZERO = -273.15f;

    /**
     * Create a temperature with a specific value and scale.
     * @param value The value of the temperature.
     * @param scale The scale of the temperature. Valid options are: C,c,F,f,K,k
     */
    Temperature(double value, char scale) {
	this.scale = Character.toUpperCase(scale);
	if (!isScaleValid(this.scale))
	    throw new IllegalArgumentException("Invalid scale provided! Options are: C,c,F,f,K,k");
	
	this.value = value;
    }

    /**
     * Get the value of this temperature.
     * @return The numeric value.
     */
    double getValue() { return value; }

    /**
     * Get the scale of this temperature.
     * @return The character representing the scale. Will return one of: C,c,F,f,K,k
     */
    char getScale() { return scale; }

    /**
     * Get a new temperature that is equal to this one, but in Kelvin.
     * @return A new Temperature object in Kelvin.
     */
    Temperature toKelvin() {
	if (scale == CELSIUS)
	    return new Temperature(value - ABSOLUTE_ZERO, KELVIN);
	else if (scale == FAHRENHEIT)
	    return new Temperature((value - 32) * 5.0 / 9.0 - ABSOLUTE_ZERO, KELVIN);
	else
	    return this;
    }

    /**
     * Get a new temperature that is equal to this one, but in Celsius."
     * @return A new Temperature object in Kelvin.
     */
    Temperature toCelsius() {
	if (scale == KELVIN)
	    return new Temperature(value + ABSOLUTE_ZERO, CELSIUS);
	else if (scale == FAHRENHEIT)
	    return new Temperature((value - 32) * 5.0 / 9.0, CELSIUS);
	else
	    return this;
    }

    /**
     * Get a new temperature that is equal to this one, but in Fahrenheit.
     * @return A new Temperature object in Kelvin.
     */
    Temperature toFahrenheit() {
	if (scale == KELVIN)
	    return new Temperature(((value + ABSOLUTE_ZERO) * 9.0 / 5.0) + 32, FAHRENHEIT);
	else if (scale == CELSIUS)
	    return new Temperature((value * 9.0 / 5.0) + 32, FAHRENHEIT);
	else
	    return this;
    }

    private static Scanner scanner = new Scanner(System.in);

    /**
     * Read a temperature in from the terminal. Input must be in the format "(value) (s)" where (value) is a numeric value and where (s) is the scale. The scale is one of: C,c,F,f,K,k.
     * @return A new Temperature object with values specified from the command line.
     */
    static Temperature readTemp() {
	String input = scanner.nextLine();
	String[] parts = input.split(" ");
	if (parts.length == 0)
	    return null;

	float value;
	try {
	    value = Float.parseFloat(parts[0]);
	} catch (NumberFormatException e) {
	    return null;
	}

	char scale = parts[1].charAt(0);
	if (!isScaleValid(scale))
	    return null;

	return new Temperature(value, scale);
    }

    /**
     * Print this Temperature to the command line.
     */
    void print() {
	System.out.printf("%.3f %c", value, scale);
    }

    /**
     * Get a temperature with a raised value.
     * @param degrees The amount of degrees to add.
     * @return A new Temperature object with a raised value.
     */
    Temperature raise(float degrees) {
	return new Temperature(value + degrees, scale);
    }

    /**
     * Get a temperature with a lowered value.
     * @param degrees The amount of degrees to subtract.
     * @return A new Temperature object with a lowered value.
     */
    Temperature lower(float degrees) {
	return new Temperature(value - degrees, scale);
    }

    /**
     * Check if this temperature is equal to another.
     * @param temp A Temperature object to compare with.
     * @return True if this Temperature is equal to the other one. Scale does not matter.
     */
    boolean equals(Temperature temp) {
	return convertTemp(temp, scale).value == value;
    }

    /**
     * Check if this temperature is less than another.
     * @param temp A Temperature object to compare with.
     * @return True if this Temperature is less than to the other one. Scale does not matter.
     */
    boolean lessThan(Temperature temp) {
	return value < convertTemp(temp, scale).value;
    }

    /**
     * Convert a temperature to another scale.
     * @param temp A Temperature object to convert.
     * @param scale The scale to convert to.
     * @return A new Temperature object converted to a different scale, or the same object that was passed in if no conversion was necessary.
     */
    private static Temperature convertTemp(Temperature temp, char scale) {
	if (temp.scale != scale) {
	    if (scale == CELSIUS)
		return temp.toCelsius();
	    else if (scale == KELVIN)
		return temp.toKelvin();
	    else
		return temp.toFahrenheit();
	}
	return temp;
    }

    /**
     * Check if a character is a valid scale value.
     * @param scale The character to check.
     * @return True if the scale character is one of C,c,F,f,K,k; false otherwise.
     */
    private static boolean isScaleValid(char scale) {
	char upperCased = Character.toUpperCase(scale);
	return upperCased == KELVIN ||
	    upperCased == CELSIUS ||
	    upperCased == FAHRENHEIT;
    }
}
