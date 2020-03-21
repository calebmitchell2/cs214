/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: David Reidsma
 * Date:    03/20/2020
 ************************************************************/

public class NameTester {
    public static void main(String[] args) {
        Name aName = new Name("John", "Paul", "Jones");
        
        assert aName.getFirst().equals("John") ;
        assert aName.getMiddle().equals("Paul") ;
        assert aName.getLast().equals("Jones") ;
        
        System.out.println(aName);
        assert aName.toString().equals("John Paul Jones");

        System.out.println("All tests passed!");
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
    
    @Override
    public String toString() {
        return first + " " + middle + " " + last;
    }
}
