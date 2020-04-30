-- walking_bird_package.ads is a derivative of Bird that has walk-specific details.
-- Completed by: David Reidsma
-- Date: 04/29/2020

with Bird_Package;
use Bird_Package;

package Walking_Bird_Package is
   
   type Walking_Bird_Type is new Bird_Type with private;
   
   -- A walking bird's movement.
   -- Receive: Bird, a Bird_Type.
   -- Return: "walked past"
   function Movement(Bird: in Walking_Bird_Type) return String;
   
private
   type Walking_Bird_Type is new Bird_Type with
      record
	 null;
      end record;
end Walking_Bird_Package;
