-- bird_package.ads gives Bird-related declarations
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 04/30/2020
---------------------------------------------------

package Bird_Package is
   type Bird_Type is abstract tagged private;

 ----------------------------------------------------
 -- initialization                                  -
 -- Receive: A_Bird, a Bird_Type;                   -
 --          Name, a String                         -
 -- Return: a Bird_Type whose My_Name = Name.       -
 ----------------------------------------------------
   procedure Init(Bird: out Bird_Type; Name: in String);
   
 ----------------------------------------------------
 -- Name accessor                                   -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: A_Bird.My_Name.                         -
 ----------------------------------------------------
   function Name(Bird: in Bird_Type) return String;
   
 ----------------------------------------------------
 -- A Bird's Call                                   -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: a default bird-call ("Squawk!").        -
 ----------------------------------------------------
   function Call(Bird: in Bird_Type) return String;
   
   ----------------------------------------------------
   -- A Bird's Movement. Must be defined by children. -
   -- Receive: Bird, a Bird_Type.                     -
   -- Return: "stood still"                           -
   ----------------------------------------------------
   function Movement(Bird: in Bird_Type) return String is abstract;
   
 ----------------------------------------------------
 -- Determine type of a Bird (for derived types)    -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: "Bird".                                 -
 ----------------------------------------------------
   function Type_Name(Bird: in Bird_Type) return String;
   
 ----------------------------------------------------
 -- Output a Bird                                   -
 -- Receive: A_Bird, a Bird or subclass of Bird.    -
 -- Output: Everything known about A_Bird           -
 ----------------------------------------------------
   procedure Put(Bird: in Bird_Type'Class);
   
private
   type Bird_Type is
      abstract tagged record
	 Name: String(1..6);
      end record;
end Bird_Package;
