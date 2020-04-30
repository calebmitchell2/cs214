-- duck_package.adb gives Duck-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 04/29/2020

with Ada.Text_IO;
use Ada.Text_IO;

package body Duck_Package is
   
   -- A Duck's Call (Over-rides Bird.Call())
   -- Receive: Duck, a Duck_Type.
   -- Return: "Quack!"
   function Call(Duck: in Duck_Type) return String is
   begin
      return "Quack!";
   end Call;

   -- Determine type of a Duck (Over-rides Bird.Type_Name())
   -- Receive: Duck, a Duck_Type.
   -- Return: "Duck".
   function Type_Name(Duck: in Duck_Type) return String is
   begin
      return "Duck";
   end Type_Name;
   
end Duck_Package;
