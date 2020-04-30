/* Owl.java provides an Owl subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: David Reidsma
 * Date: 04/30/2020
 ******************************************************/

public class Owl extends FlyingBird {
    /**
     * implicit constructor
     * Postcondition: myName = ""
     */
    public Owl() {
	super();
    }

    /* explicit constructor
     * Receive: name, a String 
     * PostCond: myName == name.
     */
    public Owl(String name) {
	super(name);
    }

    /* An Owl's Call
     * Return: an owl-call ("Whoo-hoo!").
     */
    public String getCall() { return "Whoo-hoo!"; }
} 

