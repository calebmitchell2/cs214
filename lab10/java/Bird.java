/* Bird.java provides a Bird class.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: David Reidsma
 * Date: 04/25/2020
 ******************************************************/

public class Bird
{

 /* default constructor
  * PostCond: myName == "".
  */
    public Bird() {
	myName = "";
    }

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
    public Bird(String name) {
	myName = name;
    }

 /* Name accessor
  * Return: myName.
  */
    public String getName() {
	return myName;
    }

 /* A Bird's Call
  * Return: a default bird-call ("Squawk!").
  */
    public String getCall() {
	return "Squawk!";
    }

 /* Output a Bird 
  * Output: Everything known about myself
  *          to the standard output stream.
  */
    public void print() {
	System.out.println(getName() + ' ' + getClass().getName() + " says " + getCall());
    }

    private String myName;
}

