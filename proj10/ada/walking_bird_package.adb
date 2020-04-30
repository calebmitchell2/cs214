-- walking_bird_package.adb gives definitions to a walking bird by overriding Bird's definitions.
-- Completed by: David Reidsma
-- Date: 04/29/2020

with Bird_Package;
use Bird_Package;

package body Walking_Bird_Package is
   -- A walking bird's movement.
   -- Receive: Bird, a Bird_Type.
   -- Return: "walked past"
   function Movement(Bird: in Walking_Bird_Type) return String is
   begin
      return "walked past";
   end Movement;
end Walking_Bird_Package;
