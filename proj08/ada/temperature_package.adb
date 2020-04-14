with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, Ada.Characters.Handling;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO, Ada.Characters.Handling;

package body Temperature_Package is
   procedure Init(Temp: out Temperature; Value: in Float; Scale: in Character) is
   begin
      if not Is_Valid(Value, Scale) then
	 Put("Invalid scale provided! Options are: C,c,F,f,K,k");
	 return;
      end if;
      
      Temp.Value := Value;
      Temp.Scale := Scale;
   end Init;
   
   function Get_Value(Temp: in Temperature) return Float is
   begin
      return Temp.Value;
   end Get_Value;
   
   function Get_Scale(Temp: in Temperature) return Character is
   begin
      return Temp.Scale;
   end Get_Scale;
   
   function To_Kelvin(Temp: in Temperature) return Temperature is
      New_Temp: Temperature;
   begin
      if Is_Celsius(Temp.Scale) then
	 Init(New_Temp, Celsius_To_Other(Temp.Value, KELVIN), KELVIN);
      elsif Is_Fahrenheit(Temp.Scale) then
	 Init(New_Temp, Fahrenheit_To_Other(Temp.Value, KELVIN), KELVIN);
      else
	 return Temp;
      end if;
      
      return New_Temp;
   end To_Kelvin;

   function To_Celsius(Temp: in Temperature) return Temperature is
      New_Temp: Temperature;
   begin
      if Is_Kelvin(Temp.Scale) then
	 Init(New_Temp, Kelvin_To_Other(Temp.Value, CELSIUS), CELSIUS);
      elsif Is_Fahrenheit(Temp.Scale) then
	 Init(New_Temp, Fahrenheit_To_Other(Temp.Value, CELSIUS), CELSIUS);
      else
	 return Temp;
      end if;
      
      return New_Temp;
   end To_Celsius;
   
   function To_Fahrenheit(Temp: in Temperature) return Temperature is
      New_Temp: Temperature;
   begin
      if Is_Kelvin(Temp.Scale) then
	 Init(New_Temp, Kelvin_To_Other(Temp.Value, FAHRENHEIT), FAHRENHEIT);
      elsif Is_Celsius(Temp.Scale) then
	 Init(New_Temp, Celsius_To_Other(Temp.Value, FAHRENHEIT), FAHRENHEIT);
      else
	 return Temp;
      end if;
      
      return New_Temp;
   end To_Fahrenheit;
   
   function Read_Temp return Temperature is
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
      
      if not Is_Kelvin(Scale) and not Is_Celsius(Scale) and not Is_Fahrenheit(Scale) then
	 Put("Invalid scale entered. Options are: K,k,F,f,C,c"); New_Line;
	 return Temp;
      end if;
      
      Init(Temp, Value, Scale);
      return Temp;
   end Read_Temp;
   
   procedure Put(Temp: in Temperature) is
   begin
      Put(Temp.Value, 1, 3, 0);
      Put(' ');
      Put(Temp.Scale);
   end Put;
   
   function Raise(Temp: in Temperature; Degrees: in Float) return Temperature is
      New_Temp: Temperature;
   begin
      Init(New_Temp, Temp.Value + Degrees, Temp.Scale);
      return New_Temp;
   end Raise;
   
   function Lower(Temp: in Temperature; Degrees: in Float) return Temperature is
      New_Temp: Temperature;
   begin
      Init(New_Temp, Temp.Value - Degrees, Temp.Scale);
      return New_Temp;
   end Lower;
   
   function Equals(Temp1, Temp2 in Temperature) return Boolean is
      Converted_Temp: Temperature := Temp2;
   begin
      if Temp2.Scale /= Temp1.Scale then
	 
      end if;
   end Equals;
   
   function Convert_Temp(Temp: in Temperature; Scale: in Character) return Temperature is
      
   
   function Celsius_To_Other(Value_Celsius: in Float; Scale: in Character) return Float is
   begin
      if Is_Fahrenheit(Scale) then
	 return (Value_Celsius * 9.0 / 5.0) + 32.0;
      elsif Is_Kelvin(Scale) then
	 return Value_Celsius - ABSOLUTE_ZERO;
      else
	 Put("Invalid scale provided for Celsius_To_Other. Options are: F,f,K,k");
	 return 0.0;
      end if;
   end Celsius_To_Other;
   
   function Kelvin_To_Other(Value_Kelvin: in Float; Scale: in Character) return Float is
      In_Celsius: Float := Value_Kelvin + ABSOLUTE_ZERO;
   begin
      if Is_Fahrenheit(Scale) then
	 return Celsius_To_Other(In_Celsius, FAHRENHEIT);
      elsif Is_Celsius(Scale) then
	 return In_Celsius;
      else
	 Put("Invalid scale provided for Kelvin_To_Other. Options are: F,f,C,c");
	 return 0.0;
      end if;
   end Kelvin_To_Other;
   
   function Fahrenheit_To_Other(Value_Fahrenheit: in Float; Scale: in Character) return Float is
      In_Celsius: Float := (Value_Fahrenheit - 32.0) * 5.0 / 9.0;
   begin
      
      if Is_Kelvin(Scale) then
	 return Celsius_To_Other(In_Celsius, KELVIN);
      elsif Is_Celsius(Scale) then
	 return In_Celsius;
      else
	 Put("Invalid scale provided for Fahrenheit_To_Other. Options are: K,k,C,c");
	 return 0.0;
      end if;
   end Fahrenheit_To_Other;
   
   function Is_Celsius(Scale: in Character) return Boolean is
   begin
      return Scale = 'c' or Scale = 'C';
   end Is_Celsius;
   
   function Is_Fahrenheit(Scale: in Character) return Boolean is
   begin
      return Scale = 'f' or Scale = 'F';
   end Is_Fahrenheit;
   
   function Is_Kelvin(Scale: in Character) return Boolean is
   begin
      return Scale = 'k' or Scale = 'K';
   end Is_Kelvin;
   
   function Is_Valid(Value: in Float; Scale: in Character) return Boolean is
   begin
      if not Is_Kelvin(Scale) and not Is_Celsius(Scale) and not Is_Fahrenheit(Scale) then
	 return False;
      else
	 return True;
      end if;
   end Is_Valid;
end Temperature_Package;
