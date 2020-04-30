-- birds.adb tests our Birds type hierarchy.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: David Reidsma
-- Date: 04/29/2020
-----------------------------------------------------

with Bird_Package, 
  Duck_Package, 
  Goose_Package,
  Owl_Package,
  Penguin_Package,
  Ostrich_Package,
  Kiwi_Package,
  Ada.Text_IO;
use Bird_Package,
  Duck_Package, 
  Goose_Package,
  Owl_Package,
  Kiwi_Package,
  Penguin_Package,
  Ostrich_Package,
  Ada.Text_IO;

procedure Birds is
   Bird1 : Duck_Type;
   Bird2 : Goose_Type;
   Bird3 : Owl_Type;
   Bird4 : Penguin_Type;
   Bird5 : Ostrich_Type;
   Bird6 : Kiwi_Type;

begin
   New_Line;
   Put("Welcome to the Bird Park!"); New_Line;

   Init(Bird1, "Donald");
   Put(Bird1); New_Line;

   Init(Bird2, "Mother");
   Put(Bird2); New_Line;

   Init(Bird3, "Woodsy");
   Put(Bird3); New_Line;
   
   Init(Bird4, "Arnold");
   Put(Bird4); New_Line;
   
   Init(Bird5, "Jefrey");
   Put(Bird5); New_Line;
   
   Init(Bird6, "Ronald");
   Put(Bird6); New_Line;

   New_Line;
end Birds;

