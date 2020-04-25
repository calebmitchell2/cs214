]0;david@davidreidsma:~/Programming/Calvin/cs214/lab10/java[david@davidreidsma java]$ ls
Bird.class  Birds.class  Duck.class  Goose.class  Makefile   Owl.java
Bird.java   Birds.java   Duck.java   Goose.java   Owl.class
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab10/java[david@davidreidsma java]$ cat *.java
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

/* Birds.java illustrates inheritance and polymorphism.
 *
 * Begun by: Joel Adams, for CS 214 Lab 10 at Calvin College.
 * Completed by: David Reidsma
 * Date: 04/25/2020
 *********************************************************/

public class Birds {
  
  public static void main(String[] args) {
      System.out.println("\nWelcome to the Bird Park!\n");

      Bird bird0 = new Bird();

      Bird bird1 = new Bird("Hawkeye");
      bird1.print();

      Duck bird2 = new Duck("Donald");
      bird2.print();

      Goose bird3 = new Goose("Mother Goose");
      bird3.print();

      Owl bird4 = new Owl("Woodsey");
      bird4.print();
      System.out.println();
    }
}

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

/* Goose.java provides a Goose subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: David Reidsma
 * Date: 04/25/2020
 ******************************************************/

public class Goose extends Bird {
    /**
     * implicit constructor
     * Postcondition: myName = ""
     */
    public Goose() {
	super();
    }

    /* explicit constructor
     * Receive: name, a String 
     * PostCond: myName == name.
     */
    public Goose(String name) {
	super(name);
    }

    /* A Goose's Call
     * Return: a goose-call ("Honk!").
     */
    public String getCall() { return "Honk!"; }
} 

/* Owl.java provides an Owl subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: David Reidsma
 * Date: 04/25/2020
 ******************************************************/

public class Owl extends Bird {
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

]0;david@davidreidsma:~/Programming/Calvin/cs214/lab10/java[david@davidreidsma java]$ make
javac -deprecation Birds.java
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab10/java[david@davidreidsma java]$ java Birds

Welcome to the Bird Park!

Hawkeye Bird says Squawk!
Donald Duck says Quack!
Mother Goose Goose says Honk!
Woodsey Owl says Whoo-hoo!

