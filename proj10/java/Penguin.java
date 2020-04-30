/**
 * Penguin.java defines the behavior of a penguin.
 *
 * Completed by: David Reidsma
 * Date: 04/30/2020
 */

public class Penguin extends WalkingBird {
    /**
     * implicit constructor
     * Postcondition: myName = ""
     */
    public Penguin() {
	super();
    }

    /**
     * explicit constructor
     * @param name a String 
     * PostCond: myName == name.
     */
    public Penguin(String name) {
	super(name);
    }

    /**
     * Get this Bird's call.
     * @return The call of the bird.
     */
    public String getCall() {
	return "Blraww!";
    }
}
