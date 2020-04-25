-- goose_package.adb gives Goose-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 04/25/2020
---------------------------------------------------

package body Goose_Package is

 ----------------------------------------------------
 -- A Goose's Call (Over-rides Bird.Call())         -
 -- Receive: Goose, a Goose.                        -
 -- Return: "Honk!"                                 -
 ----------------------------------------------------
   function Call(Goose: in Goose_Type) return String is
   begin
      return "Honk!";
   end Call;

 -----------------------------------------------------
 -- Determine type of a Goose                        -
 -- (Over-rides Bird.Type_Name())                    -
 -- Receive: Goose, a Goose.                         -
 -- Return: "Goose".                                 -
 -----------------------------------------------------
   function Type_Name(Goose: in Goose_Type) return String is
   begin
      return "Goose";
   end Type_Name;

end Goose_Package;
