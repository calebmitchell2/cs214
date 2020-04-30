Script started on 2020-04-30 01:05:24-04:00 [TERM="xterm-kitty" TTY="/dev/pts/0" COLUMNS="56" LINES="30"]
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10[david@davidreidsma proj10]$ cd ada
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10/ada[david@davidreidsma ada]$ ls
bird_package.adb         goose_package.o
bird_package.adb~        kiwi_package.adb
bird_package.ads         kiwi_package.ads
bird_package.ads~        kiwi_package.ali
bird_package.ali         kiwi_package.o
bird_package.o           Makefile
[0m[01;32mbirds[0m                    ostrich_package.adb
birds.adb                ostrich_package.ads
birds.adb~               ostrich_package.ali
birds.ali                ostrich_package.o
birds.o                  owl_package.adb
duck_package.adb         owl_package.adb~
duck_package.adb~        owl_package.ads
duck_package.ads         owl_package.ads~
duck_package.ads~        owl_package.ali
duck_package.ali         owl_package.o
duck_package.o           penguin_package.adb
flying_bird_package.adb  penguin_package.ads
flying_bird_package.ads  penguin_package.ali
flying_bird_package.ali  penguin_package.o
flying_bird_package.o    script.ada
goose_package.adb        walking_bird_package.adb
goose_package.adb~       walking_bird_package.ads
goose_package.ads        walking_bird_package.ali
goose_package.ads~       walking_bird_package.o
goose_package.ali
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10/ada[david@davidreidsma ada]$ cat bird_package.adb bird_pack age.ads birds.adb duck_package.adb duck_package.ads[Ks fl[K[Kgoose_package.adb goose_package.ads owl_package.adb owl_package.ads ostrich_package.adb kiwi_package.[K[K[K[K[K[K[K[K[K[K[K[K[Kostrich_package.ads kiwi_package.adb kiwi_package.ads penguin_package.adb penguin_package.ads flying_bird_package.adb flying_bird_package.ad s f[Kwalking_bird_package.adb f[Kwalking_bird_package.ads
-- bird_package.adb gives Bird-related definitions
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 04/29/2020
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Bird_Package is
 ----------------------------------------------------
 -- initialization                                  -
 -- Receive: A_Bird, a Bird_Type;                   -
 --          Name, a String                         -
 -- Return: a Bird_Type whose My_Name = Name.       -
 ----------------------------------------------------
   procedure Init(Bird: out Bird_Type; Name: in String) is
   begin
      Bird.Name := Name;
   end Init;
   
 ----------------------------------------------------
 -- Name accessor                                   -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: A_Bird.My_Name.                         -
 ----------------------------------------------------
   function Name(Bird: in Bird_Type) return String is
   begin
      return Bird.Name;
   end Name;
   
 ----------------------------------------------------
 -- A Bird's Call                                   -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: a default bird-call ("Squawk!").        -
 ----------------------------------------------------
   function Call(Bird: in Bird_Type) return String is
   begin
      return "Squawwwwwwk!";
   end Call;
    
 ----------------------------------------------------
 -- Determine type of a Bird (for derived types)    -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: "Bird".                                 -
 ----------------------------------------------------
   function Type_Name(Bird: in Bird_Type) return String is
   begin
      return "Bird";
   end Type_Name;
   
 ----------------------------------------------------
 -- Output a Bird                                   -
 -- Receive: A_Bird, a Bird or subclass of Bird.    -
 -- Output: Everything known about A_Bird           -
 ----------------------------------------------------
   procedure Put(Bird: in Bird_Type'Class) is
   begin
      Put(Name(Bird));
      Put(' ');
      Put(Type_Name(Bird));
      Put(" just ");
      Put(Movement(Bird));
      Put(" and said ");
      Put(Call(Bird));
   end Put;
end Bird_Package;

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

-- duck_package.adb gives Duck-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 04/29/2020

with Ada.Text_IO;
use Ada.Text_IO;

package body Duck_Package is
   
   -- A Duck's Call (Over-rides Bird.Call())
   -- Receive: Duck, a Duck_Type.
   -- Return: "Quack!"
   function Call(Duck: in Duck_Type) return String is
   begin
      return "Quack!";
   end Call;

   -- Determine type of a Duck (Over-rides Bird.Type_Name())
   -- Receive: Duck, a Duck_Type.
   -- Return: "Duck".
   function Type_Name(Duck: in Duck_Type) return String is
   begin
      return "Duck";
   end Type_Name;
   
end Duck_Package;
-- duck_package.ads gives Duck-related declarations,
--
--  and derives Duck from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 04/29/2020

with Bird_Package, Flying_Bird_Package;
use Bird_Package, Flying_Bird_Package;

package Duck_Package is
   
   type Duck_Type is new Flying_Bird_Type with private;   

   -- A Duck's Call (Over-rides Bird.Call())
   -- Receive: A_Duck, a Duck_Type.
   -- Return: "Quack!"
   function Call(Duck: in Duck_Type) return String;

   -- Determine type of a Duck (Over-rides Bird.Type_Name())
   -- Receive: A_Duck, a Duck_Type.
   -- Return: "Duck".
   function Type_Name(Duck: in Duck_Type) return String;

private
   type Duck_Type is new Flying_Bird_Type with
      record
	 null;
      end record;   
end Duck_Package;
-- goose_package.adb gives Goose-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 04/29/2020

with Ada.Text_IO;
use Ada.Text_IO;

package body Goose_Package is

   -- A Goose's Call (Over-rides Bird.Call())
   -- Receive: Goose, a Goose.
   -- Return: "Honk!"
   function Call(Goose: in Goose_Type) return String is
   begin
      return "Honk!";
   end Call;


   -- Determine type of a Goose
   -- (Over-rides Bird.Type_Name())
   -- Receive: Goose, a Goose.
   -- Return: "Goose".
   function Type_Name(Goose: in Goose_Type) return String is
   begin
      return "Goose";
   end Type_Name;

end Goose_Package;
-- goose_package.ads gives Goose-related declarations,
--
--  and derives Goose from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 04/29/2020

with Bird_Package, Flying_Bird_Package;
use Bird_Package, Flying_Bird_Package;

package Goose_Package is

   type Goose_Type is new Flying_Bird_Type with private;

   -- A Goose's Call (Over-rides Bird.Call())
   -- Receive: Goose, a Goose.
   -- Return: "Honk!"
   function Call(Goose: in Goose_Type) return String;

   -- Determine type of a Goose
   -- (Over-rides Bird.Type_Name())
   -- Receive: Goose, a Goose.
   -- Return: "Goose".
   function Type_Name(Goose: in Goose_Type) return String;

private
   type Goose_Type is new Flying_Bird_Type with
      record
	 null;
      end record;
end Goose_Package;
-- owl_package.adb gives Owl-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 04/29/2020

with Ada.Text_IO;
use Ada.Text_IO;

package body Owl_Package is


   -- A Owl's Call (Over-rides Bird.Call())
   -- Receive: Owl, an Owl_Type.
   -- Return: "Whoo!"
   function Call(Owl: in Owl_Type) return String is
   begin
      return "Whoo!";
   end Call;

   -- Determine type of a Owl
   -- (Over-rides Bird.Type_Name())
   -- Receive: Owl, an Owl_Type.
   -- Return: "Owl".
   function Type_Name(Owl: in Owl_Type) return String is
   begin
      return "Owl";
   end Type_Name;
   
end Owl_Package;
-- owl_package.ads gives Owl-related declarations,
--  and derives Owl from Bird.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: David Reidsma
-- Date: 04/29/2020

with Bird_Package, Flying_Bird_Package;
use Bird_Package, Flying_Bird_Package;

package Owl_Package is
   
   type Owl_Type is new Flying_Bird_Type with private;

   -- A Owl's Call (Over-rides Bird.Call())
   -- Receive: Owl, an Owl_Type.
   -- Return: "Whoo!"
   function Call(Owl: in Owl_Type) return String;

   -- Determine type of a Owl
   -- (Over-rides Bird.Type_Name())
   -- Receive: Owl, an Owl_Type.
   -- Return: "Owl".
   function Type_Name(Owl: in Owl_Type) return String;
   
private
   type Owl_Type is new Flying_Bird_Type with
      record
	 null;
      end record;
end Owl_Package;
-- ostrich_package.adb gives Ostrich-related definitions by over-riding Bird-related definitions.
-- Author: David Reidsma
-- Date: 04/29/2020

with Ada.Text_IO;
use Ada.Text_IO;

package body Ostrich_Package is
   
   -- A Ostrich's Call (Overrides Bird.Call())
   -- Receive: Ostrich, a Ostrich_Type.
   -- Return: "Rrr Rrr Rrrrrrrr!"
   function Call(Ostrich: in Ostrich_Type) return String is
   begin
      return "Rrr Rrr Rrrrrrrr!";
   end Call;

   -- Determine type of a Ostrich (Overrides Bird.Type_Name())
   -- Receive: Ostrich, a Ostrich_Type.
   -- Return: "Ostrich".
   function Type_Name(Ostrich: in Ostrich_Type) return String is
   begin
      return "Ostrich";
   end Type_Name;
end Ostrich_Package;
-- ostrich_package.ads gives Ostrich-related declarations,and derives Ostrich from Walking_Bird_Type.
-- Author: David Reidsma
-- Date: 04/29/2020

with Bird_Package, Walking_Bird_Package;
use Bird_Package, Walking_Bird_Package;

package Ostrich_Package is
   
   type Ostrich_Type is new Walking_Bird_Type with private;
   
   -- A Ostrich's Call (Overrides Bird.Call())
   -- Receive: Ostrich, a Ostrich_Type.
   -- Return: "Rrr Rrr Rrrrrrrr!"
   function Call(Ostrich: in Ostrich_Type) return String;

   -- Determine type of a Ostrich (Overrides Bird.Type_Name())
   -- Receive: Ostrich, a Ostrich_Type.
   -- Return: "Ostrich".
   function Type_Name(Ostrich: in Ostrich_Type) return String;

private
   type Ostrich_Type is new Walking_Bird_Type with
      record
	 null;
      end record;   
end Ostrich_Package;
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
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10/ada[david@davidreidsma ada]$ make
gcc -c  birds.adb
gcc -c  bird_package.adb
gcc -c  flying_bird_package.adb
gcc -c  walking_bird_package.adb
gcc -c  duck_package.adb
gcc -c  goose_package.adb
gcc -c  owl_package.adb
gcc -c  penguin_package.adb
gcc -c  ostrich_package.adb
gcc -c  kiwi_package.adb
gnatbind birds.ali
gnatlink birds.ali
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10/ada[david@davidreidsma ada]$ ./birds

Welcome to the Bird Park!
Donald Duck just flew past and said Quack!
Mother Goose just flew past and said Honk!
Woodsy Owl just flew past and said Whoo!
Arnold Penguin just walked past and said Blraww!
Jefrey Ostrich just walked past and said Rrr Rrr Rrrrrrrr!
Ronald Kiwi just walked past and said Caw!

]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10/ada[david@davidreidsma ada]$ cd ..
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj10[david@davidreidsma proj10]$ exit

Script done on 2020-04-30 01:07:19-04:00 [COMMAND_EXIT_CODE="0"]
