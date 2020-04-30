Script started on 2020-04-30 01:22:47-04:00 [TERM="xterm-kitty" TTY="/dev/pts/0" COLUMNS="56" LINES="30"]
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10[david@davidreidsma proj10]$ cd java
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10/java[david@davidreidsma java]$ ls
 Bird.class         Kiwi.class
'#Bird.java#'       Kiwi.java
 Bird.java          Kiwi.java~
 Bird.java~         Makefile
 Birds.class        Ostrich.class
 Birds.java         Ostrich.java
 Birds.java~        Ostrich.java~
 Duck.class         Owl.class
 Duck.java          Owl.java
 Duck.java~         Owl.java~
 FlyingBird.class   Penguin.class
 FlyingBird.java    Penguin.java
 FlyingBird.java~   Penguin.java~
 Goose.class        WalkingBird.class
 Goose.java         WalkingBird.java
 Goose.java~        WalkingBird.java~
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10/java[david@davidreidsma java]$ cat *.java
/* Bird.java provides a Bird class.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: David Reidsma
 * Date: 04/30/2020
 ******************************************************/

public abstract class Bird
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

    /**
     * Get a Bird's movement.
     * @return The movement of the bird.
     */
    public abstract String getMovement();
    
    /* Output a Bird 
     * Output: Everything known about myself
     *          to the standard output stream.
     */
    public void print() {
	System.out.println(getName() + ' ' + getClass().getName() + " just " + getMovement() + " and said " + getCall());
    }

    private String myName;
}

/* Birds.java illustrates inheritance and polymorphism.
 *
 * Begun by: Joel Adams, for CS 214 Lab 10 at Calvin College.
 * Completed by: David Reidsma
 * Date: 04/30/2020
 *********************************************************/

public class Birds {
  
  public static void main(String[] args) {
      System.out.println("\nWelcome to the Bird Park!\n");

      Duck duck = new Duck("Donald");
      duck.print();

      Goose goose = new Goose("Mother");
      goose.print();

      Owl owl = new Owl("Woodsey");
      owl.print();

      Penguin penguin = new Penguin("Gunther");
      penguin.print();

      Ostrich ostrich = new Ostrich("Jeffrey");
      ostrich.print();

      Kiwi kiwi = new Kiwi("Ronald");
      kiwi.print();
      
      System.out.println();
    }
}

/* Duck.java provides a Duck subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: David Reidsma
 * Date: 04/30/2020
 ******************************************************/

public class Duck extends FlyingBird {
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
/* Goose.java provides a Goose subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: David Reidsma
 * Date: 04/30/2020
 ******************************************************/

public class Goose extends FlyingBird {
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
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10/java[david@davidreidsma java]$ make
javac -deprecation Birds.java
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10/java[david@davidreidsma java]$ java Birds

Welcome to the Bird Park!

Donald Duck just flew past and said Quack!
Mother Goose just flew past and said Honk!
Woodsey Owl just flew past and said Whoo-hoo!
Gunther Penguin just walked past and said Blraww!
Jeffrey Ostrich just walked past and said Rrr Rrr Rrrrrrr!
Ronald Kiwi just walked past and said Caw!

]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10/java[david@davidreidsma java]$ cd ..
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10[david@davidreidsma proj10]$ exit

Script done on 2020-04-30 01:23:02-04:00 [COMMAND_EXIT_CODE="0"]
