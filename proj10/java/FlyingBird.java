/**
 * FlyingBird.java defines the behavior of a flying bird.
 *
 * Completed by: David Reidsma
 * Date: 04/30/2020
 */

public class FlyingBird extends Bird {
    /**
     * implicit constructor
     * Postcondition: myName = ""
     */
    public FlyingBird() {
	super();
    }

    /**
     * explicit constructor
     * @param name a String 
     * PostCond: myName == name.
     */
    public FlyingBird(String name) {
	super(name);
    }

    /**
     * Get this Bird's movement.
     * @return The movement of the bird.
     */
    public String getMovement() {
	return "flew past";
    }
}
