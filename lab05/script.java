]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05[davidreidsma@davidr-fedora lab05]$ cd java
]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/java[davidreidsma@davidr-fedora java]$ cat Split.java
/* Split.java is a class and program that splits a string
 * into two substrings.
 * 
 * Begun by: Serita Nelesen
 * Completed by: David Reidsma
 * Date:         03/06/2020
 ***************************************************************/

import java.util.Scanner;

// java class Split
public class Split
{
  // main program
  public static void main(String[] args)
    {
      Scanner keyboard = new Scanner(System.in);
      // prompt for the string
      System.out.println("\nTo split a string, enter the string: ");
      String theString = keyboard.next();
      
      // prompt for splitting position
      System.out.println("\nEnter the split position: ");
      int position = keyboard.nextInt();

      //Create list, compute results and print
      String [] resultList = new String[2];
      splitter(theString, position, resultList);
      System.out.println("\nThe first part is " + resultList[0] + "\n and the second part is " + resultList[1]);
      
    }
  
  /* splitter() splits a string according to the position specified
   * Receive: 	theString - the string to be split
   * 		pos - the position at which to split
   *            resList - an array of strings in which to place results
   *****************************************************/
    static void splitter(String theString, int pos, String[] resList) {
        resList[0] = theString.substring(0, pos);
        resList[1] = theString.substring(pos, theString.length());
    }
}
]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/java[davidreidsma@davidr-fedora java]$ javac -deprecation Split.java
]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/java[davidreidsma@davidr-fedora java]$ java Split

To split a string, enter the string: 
hello

Enter the split position: 
0

The first part is 
 and the second part is hello
]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/java[davidreidsma@davidr-fedora java]$ java Split

To split a string, enter the string: 
hello

Enter the split position: 
3

The first part is hel
 and the second part is lo
]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/java[davidreidsma@davidr-fedora java]$ java Split

To split a string, enter the string: 
hello

Enter the split position: 
5

The first part is hello
 and the second part is 
]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/java[davidreidsma@davidr-fedora java]$ exit

