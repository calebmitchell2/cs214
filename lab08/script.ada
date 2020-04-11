]0;david@davidreidsma:~/Programming/Calvin/cs214/lab08[david@davidreidsma lab08]$ cd ada
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab08/ada[david@davidreidsma ada]$ ls
Makefile           name_package.ads   name_package.o   name_tester.adb~
name_package.adb   name_package.ads~  [0m[01;32mname_tester[0m      name_tester.ali
name_package.adb~  name_package.ali   name_tester.adb  name_tester.o
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab08/ada[david@davidreidsma ada]$ cat name_package.adb name_package.ads name_tester.adb
-- name_package.adb defines operations for the Name type.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 04/10/2020
---------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

package body Name_Package is
   ----------------------------------------------
   -- Init initializes a Name variable          
   -- Receive: Nm, the Name variable;          
   --          First, the first name;         
   --          Middle, the middle name;      
   --          Last, the last name.         
   -- Return: Nm, its fields set to First, 
   --               Middle, and Last.     
   ----------------------------------------------

   procedure Init(Nm: out Name;
		  First, Middle, Last : in String) is
   begin
      Nm.MyFirst := First;
      Nm.MyMiddle := Middle;
      Nm.MyLast := Last;
   end Init;
   
   ----------------------------------------------
   -- getFirst(Name) retrieves Name.myFirst        
   -- Receive: Nm, a Name.                      
   -- PRE: Nm has been initialized.            
   -- Return: Nm.myFirst.                     
   ----------------------------------------------
   function getFirst( Nm: in Name) return String is
   begin
      return Nm.MyFirst;
   end getFirst;
   
   ----------------------------------------------
   -- getMiddle(Name) retrieves Name as a String 
   -- Receive: Nm, a Name.        
   -- PRE: Nm has been initialized.
   -- Return: Nm.myMiddle. 
   ----------------------------------------------
   function getMiddle( Nm: in Name) return String is
   begin
      return Nm.MyMiddle;
   end getMiddle;
   
   ----------------------------------------------
   -- getLast(Name) retrieves Name.myLast       
   -- Receive: Nm, a Name.                    
   -- PRE: Nm has been initialized.            
   -- Return: Nm.myLast.                        
   ----------------------------------------------
   function getLast( Nm: in Name) return String is
   begin
      return Nm.MyLast;
   end getLast;
   
   ----------------------------------------------
   -- getFullName(Name) retrieves Name as a String -
   -- Receive: Nm, a Name.                      -
   -- PRE: Nm has been initialized.             -
   -- Return: a String representation of Nm.    -
   ----------------------------------------------
   function getFullName( Nm: in Name) return String is
   begin
      return Nm.MyFirst & " "
	& Nm.MyMiddle & " "
	& Nm.MyLast;
   end getFullName;
   
   ----------------------------------------------
   -- Put(Name) displays a Name value.          -
   -- PRE: Nm has been initialized.             -
   -- Receive: Nm, a Name.                      -
   -- Output: Nm, to the screen.                -
   ----------------------------------------------
   procedure Put(Nm: in Name) is
   begin
      Put( getFullName(Nm) );
   end Put;
end Name_Package;
-- name_package.ads declares the Name type and its operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 04/10/2020
--------------------------------------------------------------

package Name_Package is
   type Name is private;
   
   ----------------------------------------------
   -- Init initializes a Name variable          
   -- Receive: Nm, the Name variable;          
   --          First, the first name;         
   --          Middle, the middle name;      
   --          Last, the last name.         
   -- Return: Nm, its fields set to First, 
   --               Middle, and Last.     
   ----------------------------------------------

   procedure Init(Nm: out Name;
		  First, Middle, Last : in String);
   
   ----------------------------------------------
   -- getFirst(Name) retrieves Name.myFirst        
   -- Receive: Nm, a Name.                      
   -- PRE: Nm has been initialized.            
   -- Return: Nm.myFirst.                     
   ----------------------------------------------
   function getFirst( Nm: in Name) return String;

   ----------------------------------------------
   -- getMiddle(Name) retrieves Name as a String 
   -- Receive: Nm, a Name.        
   -- PRE: Nm has been initialized.
   -- Return: Nm.myMiddle. 
   ----------------------------------------------
   function getMiddle( Nm: in Name) return String;

   ----------------------------------------------
   -- getLast(Name) retrieves Name.myLast       
   -- Receive: Nm, a Name.                    
   -- PRE: Nm has been initialized.            
   -- Return: Nm.myLast.                        
   ----------------------------------------------
   function getLast( Nm: in Name) return String;

   ----------------------------------------------
   -- getFullName(Name) retrieves Name as a String -
   -- Receive: Nm, a Name.                      -
   -- PRE: Nm has been initialized.             -
   -- Return: a String representation of Nm.    -
   ----------------------------------------------
   function getFullName( Nm: in Name) return String;
   
   ----------------------------------------------
   -- Put(Name) displays a Name value.          -
   -- PRE: Nm has been initialized.             -
   -- Receive: Nm, a Name.                      -
   -- Output: Nm, to the screen.                -
   ----------------------------------------------
   procedure Put(Nm: in Name);
   
   private
      NAME_SIZE : constant Positive := 8;

      type Name is
	 record
	    myFirst,
	    myMiddle,
	    MyLast : String(1..NAME_SIZE);
	 end record;

end Name_Package;
-- name_tester.adb "test-drives" the Name type.
--
-- Begun by: Dr. Adams, CPSC 280, October 1999.
-- Completed by: David Reidsma
-- Date: 04/10/2020
----------------------------------------------

with Ada.Text_IO, Name_Package; use Ada.Text_IO, Name_Package;

procedure name_tester is
   aName : Name_Package.Name;
begin
   Name_Package.Init(aName, "John    ", "Paul    ", "Jones   ");

   pragma Assert( getFirst(aName) = "John    ",
                   "getFirst() failed");
   pragma Assert( getMiddle(aName) = "Paul    ", 
                   "getMiddle() failed");
   pragma Assert( getLast(aName) = "Jones   ", 
                   "getLast() failed");
   pragma Assert( getFullName(aName) = "John     Paul     Jones   ",
                    "getFullName() failed");
   Put(aName); New_line;
   Put("All tests passed!"); New_line;
end name_tester;

]0;david@davidreidsma:~/Programming/Calvin/cs214/lab08/ada[david@davidreidsma ada]$ make
gcc -c -gnata name_tester.adb
gnatbind name_tester.ali
gnatlink name_tester.ali
]0;david@davidreidsma:~/Programming/Calvin/cs214/lab08/ada[david@davidreidsma ada]$ cd [K[K[K./name_tester 
John     Paul     Jones   
All tests passed!


