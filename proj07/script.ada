Script started on 2020-04-09 00:08:05-04:00 [TERM="xterm-256color" TTY="/dev/pts/1" COLUMNS="189" LINES="48"]
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07[david@davidreidsma proj07]$ cd ada
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07/ada[david@davidreidsma ada]$ cat name_tester.adb
-- namer.adb "test-drives" the Name type.
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by:  David Reidsma
-- Date:          04/08/2020
----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

procedure name_tester is

  NAME_SIZE : constant integer := 8;
  Chars_Read : Natural;

  type Name is
    record
      First, Middle, Last : String(1..NAME_SIZE);
    end record;

  A_Name : Name ;

  ----------------------------------------------
  -- Init initializes a Name variable          -
  -- Receive: The_Name, the Name variable;     -
  --          First, the first name;           -
  --          Middle, the middle name;         -
  --          Last, the last name.             -
  -- Return: theName, its fields set to First, -
  --               Middle, and Last.           -
  ----------------------------------------------
  procedure Init(The_Name : out Name; First, Middle, Last : in String) is
  begin
    The_Name.First := First;
    The_Name.Middle := Middle;
    The_Name.Last := Last;
  end Init;

  ----------------------------------------------
  -- Get_First(Name) retrieves Name.First      -
  -- Receive: The_Name, a Name.                -
  -- PRE: The_Name has been initialized.       -
  -- Return: The_Name.First.                   -
  ----------------------------------------------
  function Get_First(The_Name : in Name) return String is
  begin
    return The_Name.First;
  end Get_First;

  ----------------------------------------------
  -- Get_Middle(Name) retrieves Name.Middle    -
  -- Receive: The_Name, a Name.                -
  -- PRE: The_Name has been initialized.       -
  -- Return: The_Name.Middle.                  -
  ----------------------------------------------
  function Get_Middle(The_Name : in Name) return String is
  begin
    return The_Name.Middle;
  end Get_Middle;

  ----------------------------------------------
  -- Get_Last(Name) retrieves Name.Last        -
  -- Receive: The_Name, a Name.                -
  -- PRE: The_Name has been initialized.       -
  -- Return: The_Name.Last.                    -
  ----------------------------------------------
  function Get_Last(The_Name : in Name) return String is
  begin
    return The_Name.Last;
  end Get_Last;

  ----------------------------------------------------
  -- Get_Full_Name(Name) retrieves Name as a String  -
  -- Receive: The_Name, a Name.                      -
  -- PRE: The_Name has been initialized.             -
  -- Return: a String representation of The_Name     -
  ----------------------------------------------------
  function Get_Full_Name(The_Name : in Name) return String is
  begin
    return The_Name.First & " " & The_Name.Middle & " " & The_Name.Last;
  end Get_Full_Name;

  ----------------------------------------------
  -- Put(Name) displays a Name value.          -
  -- PRE: The_Name has been initialized.       -
  -- Receive: The_Name, a Name.                -
  -- Output: The_Name, to the screen.          -
  ----------------------------------------------
  procedure Put(The_Name : in Name) is
  begin
    Put(Get_Full_Name(The_Name));
  end Put;
  
  ---------------------------------------------------------------
  -- Set_First(Name, String) sets the first name of a Name.     -
  -- PRE: The_Name has been initialized.                        -
  -- Receive: The_Name, a Name.                                 -
  --          New_First, a String containing the new first name -
  ---------------------------------------------------------------
  procedure Set_First(The_Name : out Name; New_First : in String) is
  begin
    The_Name.First := New_First;
  end Set_First;
  
  -----------------------------------------------------------------
  -- Set_Middle(Name, String) sets the middle name of a Name.     -
  -- PRE: The_Name has been initialized.                          -
  -- Receive: The_Name, a Name.                                   -
  --          New_Middle, a String containing the new middle name -
  -----------------------------------------------------------------
  procedure Set_Middle(The_Name : out Name; New_Middle : in String) is
  begin
    The_Name.Middle := New_Middle;
  end Set_Middle;
  
  ---------------------------------------------------------------
  -- Set_Last(Name, String) sets the last name of a Name.       -
  -- PRE: The_Name has been initialized.                        -
  -- Receive: The_Name, a Name.                                 -
  --          New_Last, a String containing the new last name   -
  ---------------------------------------------------------------
  procedure Set_Last(The_Name : out Name; New_Last : in String) is
  begin
    The_Name.Last := New_Last;
  end Set_Last;
  
  -------------------------------------------------------------------------------
  -- LFMI(Name) returns the name in format "(last), (first) (middle initial)".  -
  -- PRE: The_Name has been initialized.                                        -
  -- Receive: The_Name, a Name.                                                 -
  -- Output: A string containing "Last, First M"                                -
  -------------------------------------------------------------------------------
  function LFMI(The_Name : in Name) return String is
  begin
    return The_Name.Last & ", " & The_Name.First & ' ' & The_Name.Middle(The_Name.Middle'First);
  end LFMI;
  
  --------------------------------------------------------------------------------
  -- Read_Name reads a first, middle and last name from the console into a Name. -
  -- PRE: The_Name has been initialized.                                         -
  -- Receive: The_Name, a Name.                                                  -
  --------------------------------------------------------------------------------
  procedure Read_Name(The_Name : out Name) is
  begin
    The_Name.First := (others => ' ');
    The_Name.Middle := (others => ' ');
    The_Name.Last := (others => ' ');
    Get_Line(The_Name.First, Chars_Read);
    Get_Line(The_Name.Middle, Chars_Read);
    Get_Line(The_Name.Last, Chars_Read);
  end Read_Name;

begin
  Init(A_Name, "John    ", "Paul    ", "Jones   ");

  pragma Assert(Get_First(A_Name) = "John    ", "Get_First failed");
  pragma Assert(Get_Middle(A_Name) = "Paul    ", "Get_Middle failed");
  pragma Assert(Get_Last(A_Name) = "Jones   ", "Get_Last failed");
  Put(A_Name); New_line;
  pragma Assert(Get_Full_Name(A_Name) = "John     Paul     Jones   ", "Get_Full_Name failed");
  Set_First(A_Name, "Finn    ");
  pragma Assert(Get_First(A_Name) = "Finn    ", "Set_First failed");
  Set_Middle(A_Name, "The     ");
  pragma Assert(Get_Middle(A_Name) = "The    ", "Set_Middle failed");
  Set_Last(A_Name, "Human   ");
  pragma Assert(Get_Last(A_Name) = "Human    ", "Set_Last failed");
  pragma Assert(LFMI(A_Name) = "Human   , Finn    T", "LMFI failed!");
  
  Put("All tests passed!"); New_line;
  
  Put("Enter a first, middle and last name, pressing enter after each:"); New_Line;
  Read_Name(A_Name);
  Put(A_Name);
end name_tester;
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07/ada[david@davidreidsma ada]$ gnatmake name_tester.adb
gnatmake: "name_tester" up to date.
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07/ada[david@davidreidsma ada]$ ./name_tester 
John     Paul     Jones   
All tests passed!
Enter a first, middle and last name, pressing enter after each:
David
Anthony
Reidsma
David    Anthony  Reidsma 
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07/ada[david@davidreidsma ada]$ cd ..
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj07[david@davidreidsma proj07]$ exit

Script done on 2020-04-09 00:08:28-04:00 [COMMAND_EXIT_CODE="0"]
