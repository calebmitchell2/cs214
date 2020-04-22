/* ListTester.java finds the maximum values in Java linked lists, and searches for values in them.
 *
 * Begun by: Dr. Adams, CS 214 at Calvin College.
 * Completed by: David Reidsma
 * Date: 04/22/2020
 */

import java.util.Collections;
import java.util.LinkedList;
import java.util.Iterator;

public class ListTester {

    public static void main(String [] args) {
	LinkedList<Integer> list1 = new LinkedList<Integer>(),
	                    list2 = new LinkedList<Integer>(),
	                    list3 = new LinkedList<Integer>(),
                  	    list4 = new LinkedList<Integer>();

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

	list4.add(11);
	list4.add(12);
	list4.add(13);
	list4.add(14);
	list4.add(15);
  
	print(list1);
	print(list2);
	print(list3);
	print(list4);

	System.out.println("Max of list1: " + Collections.max(list1));
	System.out.println("Max of list2: " + Collections.max(list2));
	System.out.println("Max of list3: " + Collections.max(list3));
	System.out.println("Index of 99 in list1: " + search(list1, 99));
	System.out.println("Index of 99 in list2: " + search(list2, 99));
	System.out.println("Index of 99 in list3: " + search(list3, 99));
	System.out.println("Index of 99 in list4: " + search(list4, 99));
    }

    /**
     * Search for an item in a LinkedList containing integers.
     * @param list The list to search.
     * @param value The integer to search for.
     * @return The index of the value in the list, or -1.
     */
    static int search(LinkedList<Integer> list, int value) {
	int index = 0;
	Iterator<Integer> iterator = list.iterator();
	while (iterator.hasNext()) {
	    if (iterator.next() == value)
		return index;
	    index++;
	}
	return -1;
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

