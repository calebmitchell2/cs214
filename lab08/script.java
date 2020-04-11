]0;david@davidreidsma:~/Programming/Calvin/cs214/lab08[david@davidreidsma lab08]$ cd java
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab08/java[david@davidreidsma java]$ ls
Makefile    Name.java   NameTester.class  [0m[01;32mNameTester.java~[0m
Name.class  Name.java~  [01;32mNameTester.java[0m
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab08/java[david@davidreidsma java]$ cat Name.java NameTester.java
/* Name.java implements class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: David Reidsma
 * Date: 04/10/2020
 ************************************************************/

class Name {

  // Name object constructor with initialization  
  public Name(final String first, final String middle, final String last) {
      myFirst = first;
      myMiddle = middle;
      myLast = last;
  }
 
  // extractor for first name of a Name object
  public final String getFirst() {
      return myFirst;
  }

  // extractor for middle name of a Name object
  public final String getMiddle() {
      return myMiddle;
  }

  // extractor for last name of a Name object
  public final String getLast() {
      return myLast;
  }
  
  // return string created by piecing together first, middle, and last names
  public final String toString() {
      return myFirst + ' ' + myMiddle + ' ' + myLast;
  }

  private String myFirst, myMiddle, myLast;  // private instance variables
}
/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: David Reidsma
 * Date: 04/10/2020
 ************************************************************/

public class NameTester  
{
  public static void main(String[] args)
  {
      Name aName = new Name("John", "Paul", "Jones");

      assert aName.getFirst().equals("John") ;
      assert aName.getMiddle().equals("Paul") ;
      assert aName.getLast().equals("Jones") ;

      System.out.println(aName);
      assert aName.toString().equals("John Paul Jones");

      System.out.println("All tests passed!");
  }
}
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab08/java[david@davidreidsma java]$ make
make: Nothing to be done for 'NameTester'.
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab08/java[david@davidreidsma java]$ java NameTester
John Paul Jones
All tests passed!
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab08/java[david@davidreidsma java]$ cd ..


