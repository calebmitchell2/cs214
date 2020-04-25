/* Duck.java provides a Duck subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: David Reidsma
 * Date: 04/25/2020
 ******************************************************/

public class Duck extends Bird {
    /**
     * implicit constructor
     * Postcondition: myName = ""
     */
    public Duck() {
	super();
    }

    /* explicit constructor
     * Receive: name, a String 
     * PostCond: myName == name.
     */
    public Duck(String name) {
	super(name);
    }

    /* A Duck's Call
     * Return: a duck-call ("Quack!").
     */
    public String getCall() { return "Quack!"; }
}

