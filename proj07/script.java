Script started on 2020-04-09 00:04:13-04:00 [TERM="xterm-256color" TTY="/dev/pts/1" COLUMNS="189" LINES="48"]
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07[david@davidreidsma proj07]$ cd java
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07/java[david@davidreidsma java]$ java[K[K[K[Kcat NameTester.java
/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: David Reidsma
 * Date:    04/08/2020
 ************************************************************/

import java.util.Scanner;

public class NameTester {
    public static void main(String[] args) {
        Name aName = new Name("John", "Paul", "Jones");
        
        assert aName.getFirst().equals("John") ;
        assert aName.getMiddle().equals("Paul") ;
        assert aName.getLast().equals("Jones") ;
        
        System.out.println(aName);
        assert aName.toString().equals("John Paul Jones");

	aName.setFirst("Finn");
	assert aName.getFirst().equals("Finn");
	aName.setMiddle("The");
	assert aName.getMiddle().equals("The");
	aName.setLast("Human");
	assert aName.getLast().equals("Human");

	assert aName.LFMI().equals("Human, Finn T");
	
        System.out.println("All tests passed!");
	System.out.println("Enter a first, middle, and last name, pressing enter after each:");
	aName.readName();
	System.out.println(aName);
    }
}

class Name {
    private String first, middle, last;

    /**
     * Creates a Name object
     * @param first The first name
     * @param middle The middle name
     * @param last The last name
     */
    Name(String first, String middle, String last) {
        this.first = first;
        this.middle = middle;
        this.last = last;
    }

    /**
     * @return The first name
     */
    String getFirst() { return first; }
    
    /**
     * @return The middle name
     */
    String getMiddle() { return middle; }

    /**
     * @return The last name
     */
    String getLast() { return last; }

    /**
     * Sets the first name.
     */
    void setFirst(String first) { this.first = first; }

    /**
     * Sets the middle name.
     */
    void setMiddle(String middle) { this.middle = middle; }

    /**
     * Sets the last name.
     */
    void setLast(String last) { this.last = last; }

    /**
     * Get the full name in format "(last), (first) (middle initial)"
     * @returns "(last), (first) (middle initial)"
     */
    String LFMI() {
	    return last + ", " + first + ' ' + middle.charAt(0);
    }
    
    private Scanner scanner = new Scanner(System.in);

    /**
     * Read in a first, middle and last name from the console.
     */
    void readName() {
        first = scanner.nextLine();
	    middle = scanner.nextLine();
	    last = scanner.nextLine();
    }
    
    @Override
    public String toString() {
        return first + " " + middle + " " + last;
    }
}
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07/java[david@davidreidsma java]$ javac -deprecation NameTester.java
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07/java[david@davidreidsma java]$ jav [Ka NameTester.java
Error: Could not find or load main class NameTester.java
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07/java[david@davidreidsma java]$ java NameTester.java[K[K[K[K[K
John Paul Jones
All tests passed!
Enter a first, middle, and last name, pressing enter after each:
David
Anthony
Reidsma
David Anthony Reidsma
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07/java[david@davidreidsma java]$ cd ..
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07[david@davidreidsma proj07]$ exit

Script done on 2020-04-09 00:04:58-04:00 [COMMAND_EXIT_CODE="0"]
