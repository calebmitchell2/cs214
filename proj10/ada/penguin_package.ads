-- penguin_package.ads gives Penguin-related declarations,and derives Penguin from Walking_Bird_Type.
-- Author: David Reidsma
-- Date: 04/29/2020

with Bird_Package, Walking_Bird_Package;
use Bird_Package, Walking_Bird_Package;

package Penguin_Package is
   
   type Penguin_Type is new Walking_Bird_Type with private;
   
   -- A Penguin's Call (Overrides Bird.Call())
   -- Receive: Penguin, a Penguin_Type.
   -- Return: "Blraww!"
   function Call(Penguin: in Penguin_Type) return String;

   -- Determine type of a Penguin (Overrides Bird.Type_Name())
   -- Receive: Penguin, a Penguin_Type.
   -- Return: "Penguin".
   function Type_Name(Penguin: in Penguin_Type) return String;

private
   type Penguin_Type is new Walking_Bird_Type with
      record
	 null;
      end record;   
end Penguin_Package;
