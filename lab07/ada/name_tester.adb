-- namer.adb "test-drives" the Name type.
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by:  David Reidsma
-- Date:          03/20/2020
----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

procedure name_tester is

  NAME_SIZE : constant integer := 8;

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


begin
  Init(A_Name, "John    ", "Paul    ", "Jones   ");

  pragma Assert( Get_First(A_Name) = "John    ", "Get_First() failed");
  pragma Assert( Get_Middle(A_Name) = "Paul    ", "Get_Middle() failed");
  pragma Assert( Get_Last(A_Name) = "Jones   ", "Get_Last() failed");
  pragma Assert( Get_Full_Name(A_Name) = "John     Paul     Jones   ", "Get_Full_Name() failed");

   Put(A_Name); New_line;
   Put("All tests passed!"); New_line;

end name_tester;

