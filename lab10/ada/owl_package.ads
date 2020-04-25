-- owl_package.ads gives Owl-related declarations,
--  and derives Owl from Bird.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 04/25/2020
---------------------------------------------------

with Bird_Package; use Bird_Package;

package Owl_Package is
   
   type Owl_Type is new Bird_Type with private;

 ----------------------------------------------------
 -- A Owl's Call (Over-rides Bird.Call())           -
 -- Receive: Owl, an Owl_Type.                      -
 -- Return: "Whoo!"                                 -
 ----------------------------------------------------
   function Call(Owl: in Owl_Type) return String;

 -----------------------------------------------------
 -- Determine type of a Owl                          -
 -- (Over-rides Bird.Type_Name())                    -
 -- Receive: Owl, an Owl_Type.                       -
 -- Return: "Owl".                                   -
 -----------------------------------------------------
   function Type_Name(Owl: in Owl_Type) return String;
   
private
   type Owl_Type is new Bird_Type with
      record
	 null;
      end record;

end Owl_Package;
