]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06[david@davidreidsma proj06]$ cd ada
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/ada[david@davidreidsma ada]$ ls
[0m[01;32marray_processor[0m  array_processor.adb  array_processor.ali  array_processor.o
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/ada[david@davidreidsma ada]$ cat array_processor.adb
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
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/ada[david@davidreidsma ada]$ gnatmake array_processor.adb
gcc -c array_processor.adb
gnatbind -x array_processor.ali
gnatlink array_processor.ali
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/ada[david@davidreidsma ada]$ ./array_processor 
Enter an array size: 3
Enter value #1: 44.2
Enter value #2: -1
Enter value #3: 5.6
44.2000 -1.0000 5.6000 
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj06/ada[david@davidreidsma ada]$ cd ..
