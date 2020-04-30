-- ostrich_package.adb gives Ostrich-related definitions by over-riding Bird-related definitions.
-- Author: David Reidsma
-- Date: 04/29/2020

with Ada.Text_IO;
use Ada.Text_IO;

package body Ostrich_Package is
   
   -- A Ostrich's Call (Overrides Bird.Call())
   -- Receive: Ostrich, a Ostrich_Type.
   -- Return: "Rrr Rrr Rrrrrrrr!"
   function Call(Ostrich: in Ostrich_Type) return String is
   begin
      return "Rrr Rrr Rrrrrrrr!";
   end Call;

   -- Determine type of a Ostrich (Overrides Bird.Type_Name())
   -- Receive: Ostrich, a Ostrich_Type.
   -- Return: "Ostrich".
   function Type_Name(Ostrich: in Ostrich_Type) return String is
   begin
      return "Ostrich";
   end Type_Name;
end Ostrich_Package;
