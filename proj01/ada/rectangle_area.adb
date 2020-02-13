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
