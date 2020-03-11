-- quad_root.adb is a driver for computeRoots.
--
-- Author: David Reidsma
-- Date:   03/11/2020

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;

procedure quad_root is
    a, b, c, root1, root2 : float := 0.0;
    success : boolean := False;

    -- computeRoots computes the roots of a quadratic equation
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
