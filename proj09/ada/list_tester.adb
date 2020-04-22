-- list_tester.adb finds the maximums of three lists of integers and looks for the value 99 in the lists.
-- 
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 04/22/2020
-------------------------------------------------- 
 
with Ada.Text_IO, Ada.Integer_Text_IO, List_Package; 
use Ada.Text_IO, Ada.Integer_Text_IO, List_Package; 
 
procedure List_Tester is 
                              -- define 3 lists 
   List1, List2, List3, List4 : List;
   -- Node: Node_Ptr;
 
begin 
  Init(List1);                -- initialize them 
  Init(List2); 
  Init(List3); 
  Init(List4);
 
  Append(99, List1);          -- 99, 88, 77, 66, 55 
  Append(88, List1);          -- max is first 
  Append(77, List1); 
  Append(66, List1); 
  Append(55, List1); 
 
  Append(55, List2);          -- 55, 66, 77, 88, 99 
  Append(66, List2);          -- max is last 
  Append(77, List2); 
  Append(88, List2); 
  Append(99, List2); 
 
  Append(55, List3);          -- 55, 77, 99, 88, 66 
  Append(77, List3);          -- max is in the middle 
  Append(99, List3); 
  Append(88, List3); 
  Append(66, List3);
  
  Append(11, List4);          -- 11, 12, 13, 14, 15
  Append(12, List4);          -- This list exists to test searching for a value that is not in this list (99).
  Append(13, List4);
  Append(14, List4);
  Append(15, List4);
 
  Put(List1); New_Line;       -- output the 3 lists 
  Put(List2); New_Line; 
  Put(list3); New_Line; 
                              -- display their maxima 
  Put("The maximum value in list 1 is ");  
  Put( Max(List1) ); 
  New_Line; 
  Put("The maximum value in list 2 is "); 
  Put( Max(List2) );
  New_Line; 
  Put("The maximum value in list 3 is ");
  Put( Max(List3) );
  New_Line; 
  
  -- This next line causes an error: 'invalid prefix in selected component "List3"
  -- Node := List3.Its_First;
  -- Put(Node.Its_Value);
  
  Put("The index of value 99 in list 1 is ");
  Put(Search(List1, 99));
  New_Line;
  Put("The index of value 99 in list 2 is ");
  Put(Search(List2, 99));
  New_Line;
  Put("The index of value 99 in list 3 is ");
  Put(Search(List3, 99));
  New_Line;
  Put("The index of value 99 in list 4 is ");
  Put(Search(List4, 99));
  New_Line;
end List_Tester;

