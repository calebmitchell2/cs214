kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab04\[davidreidsma@davidr-fedora lab04]$ cat ada/log_table.adb
-- log_table.adb computes a table of logarithms.
--
-- Input: start, stop, increment, three reals.
-- Precondition: increment is positive.
-- Output: A table of logarithms beginning with log(start),
--         ending with log(stop), with intervals of increment.
--
-- Begun by: Prof. Adams, for CS 214 at Calvin College.
-- Completed by: David Reidsma
--------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;

procedure log_table is

   Start, Stop, Increment, Counter: Float;

begin                                           -- Prompt for input
   Put_Line("To print a table of logarithms,");
   Put_Line("enter the start, stop, and increment values: ");
   Get(Start); Get(Stop); Get(Increment);

   Counter := Start;
   while Counter <= Stop loop
      Put("The logarithm of ");
      Put(Counter, 1, 15, 0);
      Put(" is ");
      Put(log(Counter, 10.0), 1, 15, 0);
      New_Line;
      Counter := Counter + Increment;
   end loop;
end log_table;

kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab04\[davidreidsma@davidr-fedora lab04]$ cd ada
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab04/ada\[davidreidsma@davidr-fedora ada]$ gnatmake log_table.adb
gnatmake: "log_table" up to date.
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab04/ada\[davidreidsma@davidr-fedora ada]$ ./log_table
To print a table of logarithms,
enter the start, stop, and increment values: 
1
2
0.5
The logarithm of 1.000000000000000 is 0.000000000000000
The logarithm of 1.500000000000000 is 0.176091253757477
The logarithm of 2.000000000000000 is 0.301030009984970
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/lab04/ada\[davidreidsma@davidr-fedora ada]$ exit

