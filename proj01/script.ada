Script started on 2020-02-12 14:19:51-05:00 [TERM="screen" TTY="/dev/pts/3" COLUMNS="172" LINES="82"]
kdavidreidsma@localhost:~/Programming/Calvin/214/proj01\[davidreidsma@localhost proj01]$ cd ada
kdavidreidsma@localhost:~/Programming/Calvin/214/proj01/ada\[davidreidsma@localhost ada]$ ls
[0m[01;32mrectangle_area[0m  rectangle_area.adb  rectangle_area.ali  rectangle_area.o
kdavidreidsma@localhost:~/Programming/Calvin/214/proj01/ada\[davidreidsma@localhost ada]$ cat rectangle_area.adb
-- rectangle_area.adb computes the area of a rectangle.
--
-- Input: The width and length of a rectangle.
-- Precondition: The width and length are positive numbers.
-- Output: The area of the rectangle.
--
-- Author: David Reidsma
-- Date: 11/02/2020
----------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO;

procedure rectangle_area is
	width, length, area : float;

	-- function rectangleArea computes a rectangle's area, given a width and length
	-- Parameter: width, a float; must be greater than 0
	-- Parameter: length, a float; must be greater than 0
	-- Return: the area of the rectangle whose sides are of lengths width and length
	----------------------------------------------------
	function rectangleArea(width: in float; length: in float) return float is
	begin
		return width * length;
	end rectangleArea;

begin
	New_Line;
	Put_Line("To compute the area of a rectangle,");

	Put(" enter a width: ");
	Get(width);
	Put(" enter a length: ");
	Get(length);

	area := rectangleArea(width, length);

	New_Line;
	Put("The area is ");
	Put(area, 1, 15, 0);
	New_Line;
end rectangle_area;
kdavidreidsma@localhost:~/Programming/Calvin/214/proj01/ada\[davidreidsma@localhost ada]$ gnatmake rectangle_area
gnatmake: "rectangle_area" up to date.
kdavidreidsma@localhost:~/Programming/Calvin/214/proj01/ada\[davidreidsma@localhost ada]$ ./rectangle_area

To compute the area of a rectangle,
 enter a width: 2
 enter a length: 2

The area is 4.000000000000000
kdavidreidsma@localhost:~/Programming/Calvin/214/proj01/ada\[davidreidsma@localhost ada]$ ./rectangle_area

To compute the area of a rectangle,
 enter a width: 4
 enter a length: 5

The area is 20.000000000000000
kdavidreidsma@localhost:~/Programming/Calvin/214/proj01/ada\[davidreidsma@localhost ada]$ cd ..
kdavidreidsma@localhost:~/Programming/Calvin/214/proj01\[davidreidsma@localhost proj01]$ exit

Script done on 2020-02-12 14:20:27-05:00 [COMMAND_EXIT_CODE="0"]
