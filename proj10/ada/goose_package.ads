-- goose_package.ads gives Goose-related declarations,
--
--  and derives Goose from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 04/29/2020

with Bird_Package, Flying_Bird_Package;
use Bird_Package, Flying_Bird_Package;

package Goose_Package is

   type Goose_Type is new Flying_Bird_Type with private;

   -- A Goose's Call (Over-rides Bird.Call())
   -- Receive: Goose, a Goose.
   -- Return: "Honk!"
   function Call(Goose: in Goose_Type) return String;

   -- Determine type of a Goose
   -- (Over-rides Bird.Type_Name())
   -- Receive: Goose, a Goose.
   -- Return: "Goose".
   function Type_Name(Goose: in Goose_Type) return String;

private
   type Goose_Type is new Flying_Bird_Type with
      record
	 null;
      end record;
end Goose_Package;
