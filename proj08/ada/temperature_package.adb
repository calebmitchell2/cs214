-- temperature_package.adb defines operations for the Temperature type.
-- Author: David Reidsma
-- Date: 04/12/2020

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Characters.Handling;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Characters.Handling;

package body Temperature_Package is
   -- Initialize a Temperature.
   -- Input:
   --    Temp, a Temperature.
   --    Value, a Float.
   --    Scale, a Character. Can be one of: F,f,K,k,C,c
   procedure Init(Temp: out Temperature; Value: in Float; Scale: in Character) is
   begin
      if not Is_Scale_Valid(Scale) then
	 Put("Invalid scale provided! Options are: C,c,F,f,K,k");
	 return;
      end if;
      
      Temp.Value := Value;
      Temp.Scale := To_Upper(Scale);
   end Init;
   
   -- Get the value of a Temperature.
   -- Precondition: the Temperature has been initialized.
   -- Input: Temp, a Temperature.
   -- Returns: a Float.
   function Get_Value(Temp: in Temperature) return Float is
   begin
      return Temp.Value;
   end Get_Value;
   
   -- Get the scale of a Temperature. Will be F, K, or C.
   -- Precondition: the Temperature has been initialized.
   -- Input: Temp, a Temperature.
   -- Returns: a Character.
   function Get_Scale(Temp: in Temperature) return Character is
   begin
      return Temp.Scale;
   end Get_Scale;
   
   -- Convert a Temperature to kelvin.
   -- Precondition: the Temperature has been initialized.
   -- Input: Temp, a Temperature.
   -- Returns: a Temperature.
   function To_Kelvin(Temp: in Temperature) return Temperature is
      New_Temp: Temperature;
   begin
      if Is_Celsius(Temp.Scale) then
	 Init(New_Temp, Convert_Value_From_Celsius(Temp.Value, KELVIN), KELVIN);
      elsif Is_Fahrenheit(Temp.Scale) then
	 Init(New_Temp, Convert_Value_From_Fahrenheit(Temp.Value, KELVIN), KELVIN);
      else
	 return Temp;
      end if;
      
      return New_Temp;
   end To_Kelvin;
   
   -- Convert a Temperature to celsius.
   -- Precondition: the Temperature has been initialized.
   -- Input: Temp, a Temperature.
   -- Returns: a Temperature.
   function To_Celsius(Temp: in Temperature) return Temperature is
      New_Temp: Temperature;
   begin
      if Is_Kelvin(Temp.Scale) then
	 Init(New_Temp, Convert_Value_From_Kelvin(Temp.Value, CELSIUS), CELSIUS);
      elsif Is_Fahrenheit(Temp.Scale) then
	 Init(New_Temp, Convert_Value_From_Fahrenheit(Temp.Value, CELSIUS), CELSIUS);
      else
	 return Temp;
      end if;
      
      return New_Temp;
   end To_Celsius;
   
   -- Convert a Temperature to fahrenheit.
   -- Precondition: the Temperature has been initialized.
   -- Input: Temp, a Temperature.
   -- Returns: a Temperature.
   function To_Fahrenheit(Temp: in Temperature) return Temperature is
      New_Temp: Temperature;
   begin
      if Is_Kelvin(Temp.Scale) then
	 Init(New_Temp, Convert_Value_From_Kelvin(Temp.Value, FAHRENHEIT), FAHRENHEIT);
      elsif Is_Celsius(Temp.Scale) then
	 Init(New_Temp, Convert_Value_From_Celsius(Temp.Value, FAHRENHEIT), FAHRENHEIT);
      else
	 return Temp;
      end if;
      
      return New_Temp;
   end To_Fahrenheit;
   
   -- Read a Temperature in from the terminal.
   -- Output: true if an error occurs, or false if not, outputted to the Error parameter.
   -- Returns: a Temperature.
   function Read_Temp(Error: out Boolean) return Temperature is
      SIZE: constant Integer := 10;
      Line: String(1 .. 10);
      Last_Index: Natural;
      Value: Float;
      Scale: Character;
      Temp: Temperature;
   begin
      Get_Line(Line, Last_Index);
      
      Value := Float'Value(Line(Line'First .. Last_Index - 2));
      Scale := Line(Last_Index);
      
      if not Is_Scale_Valid(Scale) then
	 Put("Invalid scale entered. Options are: K,k,F,f,C,c"); New_Line;
	 Error := True;
	 return Temp;
      end if;
      
      Error := False;
      Init(Temp, Value, Scale);
      return Temp;
   exception
      when Constraint_Error =>
         Error := True;
	 return Temp;
   end Read_Temp;
   
   -- Print a Temperature to the terminal.
   -- Precondition: the Temperature has been initialized.
   -- Input: Temp, a Temperature.
   procedure Put(Temp: in Temperature) is
   begin
      Put(Temp.Value, 1, 3, 0);
      Put(' ');
      Put(Temp.Scale);
   end Put;
   
   -- Raise the value of a Temperature by an amount.
   -- Precondition: the Temperature has been initialized.
   -- Input:
   --    Temp, a Temperature.
   --    Degrees, a Float; the amount to raise Temp by.
   -- Returns: a new Temperature with a raised value.
   function Raise_By(Temp: in Temperature; Degrees: in Float) return Temperature is
      New_Temp: Temperature;
   begin
      Init(New_Temp, Temp.Value + Degrees, Temp.Scale);
      return New_Temp;
   end Raise_By;
   
   -- Lower the value of a Temperature by an amount.
   -- Precondition: the Temperature has been initialized.
   -- Input:
   --    Temp, a Temperature.
   --    Degrees, a Float; the amount to lower Temp by.
   -- Returns: a new Temperature with a lowered value.
   function Lower_By(Temp: in Temperature; Degrees: in Float) return Temperature is
      New_Temp: Temperature;
   begin
      Init(New_Temp, Temp.Value - Degrees, Temp.Scale);
      return New_Temp;
   end Lower_By;
   
   -- Check if two Temperatures are equal.
   -- Precondition: both Temperatures have been initialized.
   -- Input:
   --    Temp1, a Temperature.
   --    Temp2, a Temperature.
   -- Returns: true if equal, false if not
   function Equals(Temp1, Temp2: in Temperature) return Boolean is
      Converted_Temp: Temperature := Temp2;
   begin
      if Temp2.Scale /= Temp1.Scale then
	 Converted_Temp := Convert_Temp(Temp2, Temp1.Scale);
      end if;
      return Temp1.Value = Converted_Temp.Value;
   end Equals;
   
   -- Check if a Temperature is less than another.
   -- Precondition: both Temperatures have been initialized.
   -- Input:
   --    Temp1, a Temperature.
   --    Temp2, a Temperature.
   -- Returns: true if the first is less than the second, false if not.
   function Less_Than(Temp1, Temp2: in Temperature) return Boolean is
      Converted_Temp: Temperature := Temp2;
   begin
      if Temp2.Scale /= Temp1.Scale then
	 Converted_Temp := Convert_Temp(Temp2, Temp1.Scale);
      end if;
      return Temp1.Value < Converted_Temp.Value;
   end Less_Than;
   
   -- Utility function to convert a Temperature to any scale.
   -- Precondition: the Temperature has been initialized.
   -- Input:
   --    Temp, a Temperature.
   --    Scale, a Character. Must be one of: K,k,F,f,C,c
   -- Returns: a new Temperature of the specified scale.
   function Convert_Temp(Temp: in Temperature; Scale: in Character) return Temperature is
   begin
      if Temp.Scale = Scale then
	 return Temp;
      elsif Is_Kelvin(Scale) then
	 return To_Kelvin(Temp);
      elsif Is_Celsius(Scale) then
	 return To_Celsius(Temp);
      elsif Is_Fahrenheit(Scale) then
	 return To_Fahrenheit(Temp);
      else
	 Put("Convert_Temp failed; invalid scale parameter provided. Options are: K,k,F,f,C,c"); New_Line;
	 return Temp;
      end if;
   end Convert_Temp;
   
   -- Utility function to convert a Celsius value to another scale.
   -- Input:
   --    Value_Celsius, a Float.
   --    Scale, a Character.
   -- Returns: a Float.
   function Convert_Value_From_Celsius(Value_Celsius: in Float; Scale: in Character) return Float is
   begin
      if Is_Fahrenheit(Scale) then
	 return (Value_Celsius * 9.0 / 5.0) + 32.0;
      elsif Is_Kelvin(Scale) then
	 return Value_Celsius - ABSOLUTE_ZERO;
      else
	 Put("Invalid scale provided for Convert_Value_From_Celsius. Options are: F,f,K,k");
	 return 0.0;
      end if;
   end Convert_Value_From_Celsius;
   
   -- Utility function to convert a Kelvin value to another scale.
   -- Input:
   --    Value_Kelvin, a Float.
   --    Scale, a Character.
   -- Returns: a Float.
   function Convert_Value_From_Kelvin(Value_Kelvin: in Float; Scale: in Character) return Float is
      In_Celsius: Float := Value_Kelvin + ABSOLUTE_ZERO;
   begin
      if Is_Fahrenheit(Scale) then
	 return Convert_Value_From_Celsius(In_Celsius, FAHRENHEIT);
      elsif Is_Celsius(Scale) then
	 return In_Celsius;
      else
	 Put("Invalid scale provided for Convert_Value_From_Kelvin. Options are: F,f,C,c");
	 return 0.0;
      end if;
   end Convert_Value_From_Kelvin;
   
   -- Utility function to convert a Fahrenheit value to another scale.
   -- Input:
   --    Value_Fahrenheit, a Float.
   --    Scale, a Character.
   -- Returns: a Float.
   function Convert_Value_From_Fahrenheit(Value_Fahrenheit: in Float; Scale: in Character) return Float is
      In_Celsius: Float := (Value_Fahrenheit - 32.0) * 5.0 / 9.0;
   begin
      
      if Is_Kelvin(Scale) then
	 return Convert_Value_From_Celsius(In_Celsius, KELVIN);
      elsif Is_Celsius(Scale) then
	 return In_Celsius;
      else
	 Put("Invalid scale provided for Convert_Value_From_Fahrenheit. Options are: K,k,C,c");
	 return 0.0;
      end if;
   end Convert_Value_From_Fahrenheit;
   
   -- Utility function to check if a scale character is Celsius.
   -- Input: Scale, a Character.
   -- Returns: true if Celsius, false if not.
   function Is_Celsius(Scale: in Character) return Boolean is
   begin
      return Scale = 'c' or Scale = 'C';
   end Is_Celsius;
   
   -- Utility function to check if a scale character is Fahrenheit.
   -- Input: Scale, a Character.
   -- Returns: true if Fahrenheit, false if not.
   function Is_Fahrenheit(Scale: in Character) return Boolean is
   begin
      return Scale = 'f' or Scale = 'F';
   end Is_Fahrenheit;
   
   -- Utility function to check if a scale character is Kelvin.
   -- Input: Scale, a Character.
   -- Returns: true if Kelvin, false if not.
   function Is_Kelvin(Scale: in Character) return Boolean is
   begin
      return Scale = 'k' or Scale = 'K';
   end Is_Kelvin;
   
   -- Utility function to check if a scale character is valid.
   -- Input: Scale, a Character.
   -- Returns: true if valid, false if not.
   function Is_Scale_Valid(Scale: in Character) return Boolean is
   begin
      if not Is_Kelvin(Scale) and not Is_Celsius(Scale) and not Is_Fahrenheit(Scale) then
	 return False;
      else
	 return True;
      end if;
   end Is_Scale_Valid;
end Temperature_Package;
