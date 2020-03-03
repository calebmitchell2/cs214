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
