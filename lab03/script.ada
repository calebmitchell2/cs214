kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ cat year_codes.adb
-- year_codes.adb converts academic year codes to corresponding years.
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Finished by: David Reidsma
-- Date: 02/21/2020
--
-- Input: year, a string
-- Precondition: year is one of "freshman", "sophomore", "junior", "senior"
-- Output: The year code (1, 2, 3 or 4) corresponding to year.
----------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure year_codes is

   year : String(1..9) := "         ";
   charsRead : Natural;

   function yearCode(year : string) return integer is
   begin
      if year = "freshman " then
         return 1;
      elsif year = "sophomore" then
         return 2;
      elsif year = "junior   " then
         return 3;
      elsif year = "senior   " then
         return 4;
      else
         return 0;
      end if;
   end yearCode;

begin                                          
   Put("Enter your academic year: ");           -- Prompt for input
   Get_Line(year, charsRead);                   -- Input
   Put( yearCode(year) );                       -- Convert and output
   New_Line;
end year_codes;

kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ gnatmake year_codes.adb
gcc -c year_codes.adb
gnatbind -x year_codes.ali
gnatlink year_codes.ali
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ ./yearC[K_codes
Enter your academic year: freshman
          1
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ ./year_codes
Enter your academic year: sophomore
          2
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ ./year_codes
Enter your academic year: junior
          3
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ ./year_codes
Enter your academic year: senior
          4
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ ./year_codes
Enter your academic year: wibbly-wobbly timey-wimey
          0
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab03\[davidreidsma@davidr-fedora lab03]$ exit

