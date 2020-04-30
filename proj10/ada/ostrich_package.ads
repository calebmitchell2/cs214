-- ostrich_package.ads gives Ostrich-related declarations,and derives Ostrich from Walking_Bird_Type.
-- Author: David Reidsma
-- Date: 04/29/2020

with Bird_Package, Walking_Bird_Package;
use Bird_Package, Walking_Bird_Package;

package Ostrich_Package is
   
   type Ostrich_Type is new Walking_Bird_Type with private;
   
   -- A Ostrich's Call (Overrides Bird.Call())
   -- Receive: Ostrich, a Ostrich_Type.
   -- Return: "Rrr Rrr Rrrrrrrr!"
   function Call(Ostrich: in Ostrich_Type) return String;

   -- Determine type of a Ostrich (Overrides Bird.Type_Name())
   -- Receive: Ostrich, a Ostrich_Type.
   -- Return: "Ostrich".
   function Type_Name(Ostrich: in Ostrich_Type) return String;

private
   type Ostrich_Type is new Walking_Bird_Type with
      record
	 null;
      end record;   
end Ostrich_Package;
