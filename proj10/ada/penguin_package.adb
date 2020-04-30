-- penguin_package.adb gives Penguin-related definitions by over-riding Bird-related definitions.
-- Author: David Reidsma
-- Date: 04/29/2020

with Ada.Text_IO;
use Ada.Text_IO;

package body Penguin_Package is
   
   -- A Penguin's Call (Overrides Bird.Call())
   -- Receive: Penguin, a Penguin_Type.
   -- Return: "Blraww!"
   function Call(Penguin: in Penguin_Type) return String is
   begin
      return "Blraww!";
   end Call;

   -- Determine type of a Penguin (Overrides Bird.Type_Name())
   -- Receive: Penguin, a Penguin_Type.
   -- Return: "Penguin".
   function Type_Name(Penguin: in Penguin_Type) return String is
   begin
      return "Penguin";
   end Type_Name;
end Penguin_Package;
