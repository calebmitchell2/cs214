]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05[davidreidsma@davidr-fedora lab05]$ cd ada
]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/ada[davidreidsma@davidr-fedora ada]$ cat split.adb
-- split.adb splits an input string about a specified position.
--
-- Input: Astring, a string,
--        Pos, an integer.
-- Precondition: pos is in Astring'Range.
-- Output: The substrings Astring(Astring'First..Pos-1) and
--                        Astring(Pos..Astring'Last).
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date:         03/06/2020
--------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed;

procedure split is

   EMPTY_STRING : String := "                                        ";

   Astring, Part1, Part2 : String  := EMPTY_STRING;
   Pos, Chars_read       : Natural;

   ------------------------------------------------
   --  split() splits a string in two.           
   -- Receive: The_String, the string to be split,
   --          Position, the split index.        
   -- PRE: 0 < Position <= The_String.length(). 
   --     (Ada arrays are 1-relative by default)
   -- Passback: First_Part - the first substring,
   --           Last_Part - the second substring.
   ------------------------------------------------
   procedure split(The_String: in String; Position: in Integer; First_Part: out String; Last_Part: out String) is
   begin
      Move(The_String(The_String'First..Position - 1), First_Part);
      Move(The_String(Position..The_String'Last), Last_Part);
   end split;

begin                                           -- Prompt for input
   Put("To split a string, enter the string: ");
   Get_Line(Astring, Chars_Read);
   Put("Enter the split position: ");
   Get(Pos);

   split(Astring, Pos, Part1, Part2);

   Put("The first part is ");
   Put_Line(Part1);
   Put(" and the second part is ");
   Put_Line(Part2);

end split;

]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/ada[davidreidsma@davidr-fedora ada]$ gnatmake split.adb
gnatmake: "split" up to date.
]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/ada[davidreidsma@davidr-fedora ada]$ ./split
To split a string, enter the string: hello
Enter the split position: 1
The first part is                                         
 and the second part is hello                                   
]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/ada[davidreidsma@davidr-fedora ada]$ ./split
To split a string, enter the string: hello
Enter the split position: 4
The first part is hel                                     
 and the second part is lo                                      
]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/ada[davidreidsma@davidr-fedora ada]$ ./split [K
To split a string, enter the string: hello
Enter the split position: 6
The first part is hello                                   
 and the second part is                                         
]0;davidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab05/ada[davidreidsma@davidr-fedora ada]$ exit

