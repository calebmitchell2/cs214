-- flying_bird_package.adb gives definitions to a flying bird by overriding Bird's definitions.
-- Completed by: David Reidsma
-- Date: 04/29/2020

with Bird_Package;
use Bird_Package;

package body Flying_Bird_Package is
   -- A flying bird's movement.
   -- Receive: Bird, a Bird_Type.
   -- Return: "flew past"
   function Movement(Bird: in Flying_Bird_Type) return String is
   begin
      return "flew past";
   end Movement;
end Flying_Bird_Package;
