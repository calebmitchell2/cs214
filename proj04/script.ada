kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04\[davidreidsma@davidr-fedora proj04]$ cat ada/factorial_driver.adb 
-- factorial_driver.adb is a driver for getFactorial.
--
-- Author: David Reidsma
-- Date:   03/02/2020

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

procedure factorial_driver is
    
    input : integer := 0;
    factorial : float := 0.0;

    -- getFactorial computes n!.
    -- Input: n, an integer
    -- Output: The factorial of n
    function getFactorial(n : in integer) return float is
        answer : float := 1.0;
    begin
        for i in integer range 2 .. n loop
           answer := answer * Float(i);
        end loop;
        return answer;
    end getFactorial;

-- Main function of a program that computes factorials
begin
    Put("To compute n!, enter n: ");
    Get(input);
    Put(input);
    Put("! = ");
    factorial := getFactorial(input);
    Put(factorial, 1, 15, 0);
end factorial_driver;
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04\[davidreidsma@davidr-fedora proj04]$ cd ada
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04/ada\[davidreidsma@davidr-fedora ada]$ gnatmake factorial_driver.adb
gnatmake: "factorial_driver" up to date.
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04/ada\[davidreidsma@davidr-fedora ada]$ ./factorial_driver 
To compute n!, enter n: 0
          0! = 1.000000000000000
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04/ada\[davidreidsma@davidr-fedora ada]$ ./factorial_driver 
To compute n!, enter n: 10
         10! = 3628800.000000000000000
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04/ada\[davidreidsma@davidr-fedora ada]$ ./factorial_driver 
To compute n!, enter n: 21
         21! = 51090940837169725400.000000000000000
kdavidreidsma@davidr-fedora:~/Programming/Calvin/cs214/proj04/ada\[davidreidsma@davidr-fedora ada]$ exit

