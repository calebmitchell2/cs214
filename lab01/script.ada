Script started on 2020-02-06 13:16:58-0500
dar23@gold14:~/cs214$ cat circle_area.adb
-- circle_area.adb computes the area of a circle.
--
-- Input: The radius of the circle.
-- Precondition: The radius is a positive number.
-- Output: The area of the circle.
--
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 06/02/2020
----------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Float_Text_IO;

procedure circle_area is -- according to learn.adacore.com, procedures are one kind of subprogram. This is a subprogram with another nested inside.

   radius, area : float; -- creating two float variables

   -- function circleArea computes a circle's area, given its radius
   -- Parameter: r, a float
   -- Precondition: r >= 0.0
   -- Return: the area of the circle whose radius is r
   ----------------------------------------------------
   function circleArea(r: in float) return float is -- function initialization
      PI : constant := 3.1415927; -- creation of PI constant
   begin -- beginning of the block
      return PI * r ** 2; -- return the area
   end circleArea; -- end of the block

begin -- beginning of the block
   New_Line; -- \n
   Put_Line("To compute the area of a circle,"); -- print with \n
   Put("enter its radius: "); -- print
   Get(radius); -- receive input, place it into a radius variable

   area := circleArea(radius); -- set the area of a circle of a given radius into a variable called area

   New_Line; -- \n
   Put("The circle's area is "); -- print
   Put(area); -- print
   New_Line; New_Line; -- \n\n

   Put("The circle's area is "); -- print
   Put(area, 1, 15, 0); -- print
   New_Line; New_Line;  -- \n\n
end circle_area; -- end of the block
dar23@gold14:~/cs214$ gnatmake circle_area
x86_64-linux-gnu-gcc-7 -c circle_area.adb
x86_64-linux-gnu-gnatbind-7 -x circle_area.ali
x86_64-linux-gnu-gnatlink-7 circle_area.ali
dar23@gold14:~/cs214$ ./circle_area 

To compute the area of a circle,
enter its radius: 1

The circle's area is  3.14159E+00

The circle's area is 3.141592741012573

dar23@gold14:~/cs214$ ./circle_area 

To compute the area of a circle,
enter its radius: 2

The circle's area is  1.25664E+01

The circle's area is 12.566370964050293

dar23@gold14:~/cs214$ ./circle_area 

To compute the area of a circle,
enter its radius: 2.5

The circle's area is  1.96350E+01

The circle's area is 19.634954452514648

dar23@gold14:~/cs214$ ./circle_area 

To compute the area of a circle,
enter its radius: 4.99999

The circle's area is  7.85395E+01

The circle's area is 78.539505004882813

dar23@gold14:~/cs214$ exit

Script done on 2020-02-06 13:18:03-0500
