-- case_statement.adb is a driver for letterGrade.
--
-- Author: David Reidsma
-- Date:   02/25/2020

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure case_statement is
    
    grade : integer := 0;

    -- letterGrade converts a numerical grade into its letter code.
    -- Input: average, a numerical grade in range 0-100.
    -- Output: A letter grade.
    function letterGrade(average : integer) return character is
    begin
        case average / 10 is
            when 10 | 9 => return 'A';
            when 8 => return 'B';
            when 7 => return 'C';
            when 6 => return 'D';
            when others => return 'F';
        end case;
    end letterGrade;

-- Main function of a program that allows the user to enter a numerical grade from 0-100 and then prints out the equivalent letter grade.
begin
    Put("Enter your grade: ");
    Get(grade);
    Put(letterGrade(grade));
end case_statement;
