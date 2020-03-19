-- array_processor.adb is a program that reads in and prints out an array.
--
-- Author: David Reidsma
-- Date:   03/18/2020

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

procedure array_processor is
    type Vector is array (Positive range <>) of Float;
    arraySize : integer := 0;

    -- readArray reads in an array.
    -- Input: arr, an array to fill with values
    procedure readArray(arr: in out Vector) is
        inputValue: float := 0.0;
    begin
        for i in 1..arr'Length
        loop
            Put("Enter value #");
            Put(i, Width => 1);
            Put(": ");
            
            Get(inputValue);
            arr(i) := inputValue;
        end loop;
    end readArray;

    -- printArray prints out the values of an array.
    -- Input: arr, an array to print
    procedure printArray(arr: in Vector) is
    begin
        for i in 1..arr'Length
        loop
            Put(arr(i), 1, 4, 0);
            Put(" ");
        end loop;
    end printArray;

-- Main function of a program that reads in an array from the user and prints it back out
begin
    Put("Enter an array size: ");
    Get(arraySize);

    declare
       arr: Vector (1..arraySize);
    begin
        readArray(arr);
        printArray(arr);
    end;
end array_processor;
