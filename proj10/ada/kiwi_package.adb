-- kiwi_package.adb gives Kiwi-related definitions by over-riding Bird-related definitions.
-- Author: David Reidsma
-- Date: 04/29/2020

with Ada.Text_IO;
use Ada.Text_IO;

package body Kiwi_Package is
   
   -- A Kiwi's Call (Overrides Bird.Call())
   -- Receive: Kiwi, a Kiwi_Type.
   -- Return: "Caw!"
   function Call(Kiwi: in Kiwi_Type) return String is
   begin
      return "Caw!";
   end Call;

   -- Determine type of a Kiwi (Overrides Bird.Type_Name())
   -- Receive: Kiwi, a Kiwi_Type.
   -- Return: "Kiwi".
   function Type_Name(Kiwi: in Kiwi_Type) return String is
   begin
      return "Kiwi";
   end Type_Name;
end Kiwi_Package;
