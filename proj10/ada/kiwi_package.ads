-- kiwi_package.ads gives Kiwi-related declarations,and derives Kiwi from Walking_Bird_Type.
-- Author: David Reidsma
-- Date: 04/29/2020

with Bird_Package, Walking_Bird_Package;
use Bird_Package, Walking_Bird_Package;

package Kiwi_Package is
   
   type Kiwi_Type is new Walking_Bird_Type with private;
   
   -- A Kiwi's Call (Overrides Bird.Call())
   -- Receive: Kiwi, a Kiwi_Type.
   -- Return: "Caw!"
   function Call(Kiwi: in Kiwi_Type) return String;

   -- Determine type of a Kiwi (Overrides Bird.Type_Name())
   -- Receive: Kiwi, a Kiwi_Type.
   -- Return: "Kiwi".
   function Type_Name(Kiwi: in Kiwi_Type) return String;

private
   type Kiwi_Type is new Walking_Bird_Type with
      record
	 null;
      end record;   
end Kiwi_Package;
