/**
 * Kiwi.java defines the behavior of a kiwi.
 *
 * Completed by: David Reidsma
 * Date: 04/30/2020
 */

public class Kiwi extends WalkingBird {
    /**
     * implicit constructor
     * Postcondition: myName = ""
     */
    public Kiwi() {
	super();
    }

    /**
     * explicit constructor
     * @param name a String 
     * PostCond: myName == name.
     */
    public Kiwi(String name) {
	super(name);
    }

    /**
     * Get this Bird's call.
     * @return The call of the bird.
     */
    public String getCall() {
	return "Caw!";
    }
}
