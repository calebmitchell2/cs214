/**
 * WalkingBird.java defines the behavior of a walking bird.
 *
 * Completed by: David Reidsma
 * Date: 04/30/2020
 */

public class WalkingBird extends Bird {
    /**
     * implicit constructor
     * Postcondition: myName = ""
     */
    public WalkingBird() {
	super();
    }

    /**
     * explicit constructor
     * @param name a String 
     * PostCond: myName == name.
     */
    public WalkingBird(String name) {
	super(name);
    }

    /**
     * Get this Bird's movement.
     * @return The movement of the bird.
     */
    public String getMovement() {
	return "walked past";
    }
}
