-- bird_package.adb gives Bird-related definitions
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 04/29/2020
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Bird_Package is
 ----------------------------------------------------
 -- initialization                                  -
 -- Receive: A_Bird, a Bird_Type;                   -
 --          Name, a String                         -
 -- Return: a Bird_Type whose My_Name = Name.       -
 ----------------------------------------------------
   procedure Init(Bird: out Bird_Type; Name: in String) is
   begin
      Bird.Name := Name;
   end Init;
   
 ----------------------------------------------------
 -- Name accessor                                   -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: A_Bird.My_Name.                         -
 ----------------------------------------------------
   function Name(Bird: in Bird_Type) return String is
   begin
      return Bird.Name;
   end Name;
   
 ----------------------------------------------------
 -- A Bird's Call                                   -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: a default bird-call ("Squawk!").        -
 ----------------------------------------------------
   function Call(Bird: in Bird_Type) return String is
   begin
      return "Squawwwwwwk!";
   end Call;
    
 ----------------------------------------------------
 -- Determine type of a Bird (for derived types)    -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: "Bird".                                 -
 ----------------------------------------------------
   function Type_Name(Bird: in Bird_Type) return String is
   begin
      return "Bird";
   end Type_Name;
   
 ----------------------------------------------------
 -- Output a Bird                                   -
 -- Receive: A_Bird, a Bird or subclass of Bird.    -
 -- Output: Everything known about A_Bird           -
 ----------------------------------------------------
   procedure Put(Bird: in Bird_Type'Class) is
   begin
      Put(Name(Bird));
      Put(' ');
      Put(Type_Name(Bird));
      Put(" just ");
      Put(Movement(Bird));
      Put(" and said ");
      Put(Call(Bird));
   end Put;
end Bird_Package;

