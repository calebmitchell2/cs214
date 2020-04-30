/**
 * Ostrich.java defines the behavior of an ostrich.
 *
 * Completed by: David Reidsma
 * Date: 04/30/2020
 */

public class Ostrich extends WalkingBird {
    /**
     * implicit constructor
     * Postcondition: myName = ""
     */
    public Ostrich() {
	super();
    }

    /**
     * explicit constructor
     * @param name a String 
     * PostCond: myName == name.
     */
    public Ostrich(String name) {
	super(name);
    }

    /**
     * Get this Bird's call.
     * @return The call of the bird.
     */
    public String getCall() {
	return "Rrr Rrr Rrrrrrr!";
    }
}
