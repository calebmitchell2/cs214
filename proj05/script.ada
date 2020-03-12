Script started on 2020-03-11 22:15:55-0400
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05[00m$ cd ada
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05/ada[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05/ada[00m$ cat quad_roo t.adb
-- quad_root.adb is a driver for computeRoots.
--
-- Author: David Reidsma
-- Date:   03/11/2020

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;

procedure quad_root is
    a, b, c, root1, root2 : float := 0.0;
    success : boolean := False;

    -- computeRoots computes the roots of a quadratic equation.
    -- Input: a, a float
    -- Input: b, a float
    -- Input: c, a float
    -- Input: root1, a float to store the first root
    -- Input: root2, a float to store the second root
    -- Output: True if successful, false if not
    function computeRoots(a : in float; b : in float; c : in float; root1 : out float; root2 : out float) return boolean is
        answer : float := 1.0;
        arg : float := 0.0;
    begin
        if a /= 0.0 then
            arg := (b ** 2.0) - (4.0 * a * c);
            if arg >= 0.0 then
                root1 := (-b + Sqrt(arg)) / (2.0 * a);
                root2 := (-b - Sqrt(arg)) / (2.0 * a);
                return True;
            else
                Put("b^2 - 4ac is negative!");
                root1 := 0.0;
                root2 := 0.0;
                return False;
            end if;
        else
            Put("a is zero!");
            root1 := 0.0;
            root2 := 0.0;
            return False;
        end if;
    end computeRoots;

-- Main function of a program that computes quadratic roots
begin
    Put("Enter a: ");
    Get(a);
    Put("Enter b: ");
    Get(b);
    Put("Enter c: ");
    Get(c);

    success := computeRoots(a, b, c, root1, root2);
    if success then
        Put(root1, 1, 15, 0);
        Put(", ");
        Put(root2, 1, 15, 0);
    end if;
end quad_root;
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05/ada[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05/ada[00m$ gnatmake qua d_root
x86_64-linux-gnu-gcc-8 -c quad_root.adb
x86_64-linux-gnu-gnatbind-8 -x quad_root.ali
x86_64-linux-gnu-gnatlink-8 quad_root.ali
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05/ada[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05/ada[00m$ ./quad_rot
bash: ./quad_rot: No such file or directory
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05/ada[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05/ada[00m$ ./quad_rotot
Enter a: 1
Enter b: 25
Enter c: 25
-1.043560981750488, -23.956439971923828
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05/ada[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05/ada[00m$ ./quad_root
Enter a: 3
Enter b: 10
Enter c: 4
-0.464816242456436, -2.868516921997070
]0;david@david-ThinkPad-P52s: ~/Programming/Calvin/cs214/proj05/ada[01;32mdavid@david-ThinkPad-P52s[00m:[01;34m~/Programming/Calvin/cs214/proj05/ada[00m$ exit

Script done on 2020-03-11 22:20:40-0400
