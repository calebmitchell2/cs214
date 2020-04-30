-- flying_bird_package.ads is a derivative of Bird that has flight-specific details.
-- Completed by: David Reidsma
-- Date: 04/29/2020

with Bird_Package;
use Bird_Package;

package Flying_Bird_Package is
   
   type Flying_Bird_Type is new Bird_Type with private;
   
   -- A flying bird's movement.
   -- Receive: Bird, a Bird_Type.
   -- Return: "flew past"
   function Movement(Bird: in Flying_Bird_Type) return String;
   
private
   type Flying_Bird_Type is new Bird_Type with
      record
	 null;
      end record;
end Flying_Bird_Package;
