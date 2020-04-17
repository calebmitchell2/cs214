/* Max.java finds the maximum values in Java linked lists.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by: David Reidsma
 * Date: 04/16/2020
 */

import java.util.Collections;
import java.util.LinkedList;
import java.util.Iterator;

public class Max {

    public static void main(String [] args) {
	LinkedList<Integer> list1 = new LinkedList<Integer>(),
	                    list2 = new LinkedList<Integer>(),
                	    list3 = new LinkedList<Integer>();

	list1.add(99);    // 99, 88, 77, 66, 55
	list1.add(88);    // max is first
	list1.add(77);
	list1.add(66);  
	list1.add(55);

	list2.add(55);    // 55, 66, 77, 88, 99
	list2.add(66);    // max is last
	list2.add(77);  
	list2.add(88);  
	list2.add(99);  
  
	list3.add(55);    // 55, 77, 99, 88, 66
	list3.add(77);    // max is in the middle
	list3.add(99);  
	list3.add(88);  
	list3.add(66);  
  
	print(list1);
	print(list2);
	print(list3);

	System.out.println("Max of list1: " + Collections.max(list1));
	System.out.println("Max of list2: " + Collections.max(list2));
	System.out.println("Max of list3: " + Collections.max(list3));
    }

    /** print() displays a LinkedList on the console.
     *
     * @param: list, a LinkedList<Integer>
     * 
     * Postcondition: the Integer values in list
     *                 have been displayed to System.out,
     *                 separated by spaces.
     */
    static void print(LinkedList<Integer> list) {
	Iterator<Integer> iterator = list.iterator();
	while (iterator.hasNext()) {
	    System.out.print(iterator.next() + " ");
	}
	System.out.println();
    }
}

