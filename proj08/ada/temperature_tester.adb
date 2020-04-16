-- Driver for the Temperature type.
-- Author: David Reidsma
-- Date: 04/12/2020

with Ada.Text_IO, Ada.Float_Text_IO, Temperature_Package;
use Ada.Text_IO, Ada.Float_Text_IO, Temperature_Package;

procedure Temperature_Tester is
   Start: Temperature_Package.Temperature;
   Start_Scale: Character;
   Stop: Temperature_Package.Temperature;
   Step_String: String(1 .. 20);
   Step: Float;
   Error: Boolean := False;
   Current: Temperature_Package.Temperature;
begin
   Put("Temperature examples:"); New_Line;
   Put("20.5 C"); New_Line;
   Put("10 K"); New_Line;
   Put("35.1 F"); New_Line;
   Put("Enter a start temperature: ");
   Start := Temperature_Package.Read_Temp(Error);
   while Error loop
      Put("Invalid input, try again: ");
      Start := Temperature_Package.Read_Temp(Error);
   end loop;
   
   Start_Scale := Temperature_Package.Get_Scale(Start);
   
   Put("Enter a stop temperature: ");
   Stop := Temperature_Package.Read_Temp(Error);
   while Error loop
      Put("Invalid input, try again: ");
      Stop := Temperature_Package.Read_Temp(Error);
   end loop;
   
   Put("Enter a step amount of degrees (in the same scale as your start temperature): ");
   Step := Temperature_Package.Read_Degrees(Error);
   while Error loop
      Put("Invalid input, try again: ");
      Step := Temperature_Package.Read_Degrees(Error);
   end loop;
   
   if Temperature_Package.Equals(Start, Stop) then
      Put("Start and stop temperatures are already equal.");
      New_Line;
      return;
   end if;
   
   Current := Start;
   Print_Table_Loop:
       loop
	  if Temperature_Package.Less_Than(Start, Stop) /= Temperature_Package.Less_Than(Current, Stop) and not Temperature_Package.Equals(Current, Stop) then
	     exit Print_Table_Loop;
	  end if;
      
	  Set_Col(1);
	  Put(Temperature_Package.To_Fahrenheit(Current));
	  Set_Col(15);
	  Put(Temperature_Package.To_Celsius(Current));
	  Set_Col(29);
	  Put(Temperature_Package.To_Kelvin(Current));
	  New_Line;

	  if Temperature_Package.Less_Than(Start, Stop) then
	     Current := Temperature_Package.Raise_By(Current, Step);
	  else
	     Current := Temperature_Package.Lower_By(Current, Step);
	  end if;
       end loop Print_Table_Loop;
end Temperature_Tester;
