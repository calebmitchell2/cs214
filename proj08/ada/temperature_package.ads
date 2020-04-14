-- temperature_package.ads declares the Temperature type and its operations.
-- Author: David Reidsma
-- Date: 04/12/2020
package Temperature_Package is
   type Temperature is private;
   
   -- Initialize a Temperature.
   -- Input:
   --    Temp, a Temperature.
   --    Value, a Float.
   --    Scale, a Character. Can be one of: F,f,K,k,C,c
   procedure Init(Temp: out Temperature; Value: in Float; Scale: in Character);
   -- Get the value of a Temperature.
   -- Precondition: the Temperature has been initialized.
   -- Input: Temp, a Temperature.
   -- Returns: a Float.
   function Get_Value(Temp: in Temperature) return Float;
   -- Get the scale of a Temperature. Will be F, K, or C.
   -- Precondition: the Temperature has been initialized.
   -- Input: Temp, a Temperature.
   -- Returns: a Character.
   function Get_Scale(Temp: in Temperature) return Character;
   -- Convert a Temperature to kelvin.
   -- Precondition: the Temperature has been initialized.
   -- Input: Temp, a Temperature.
   -- Returns: a Temperature.
   function To_Kelvin(Temp: in Temperature) return Temperature;
   -- Convert a Temperature to celsius.
   -- Precondition: the Temperature has been initialized.
   -- Input: Temp, a Temperature.
   -- Returns: a Temperature.
   function To_Celsius(Temp: in Temperature) return Temperature;
   -- Convert a Temperature to fahrenheit.
   -- Precondition: the Temperature has been initialized.
   -- Input: Temp, a Temperature.
   -- Returns: a Temperature.
   function To_Fahrenheit(Temp: in Temperature) return Temperature;
   -- Read a Temperature in from the terminal.
   -- Output: true if an error occurs, or false if not, outputted to the Error parameter.
   -- Returns: a Temperature.
   function Read_Temp(Error: out Boolean) return Temperature;
   -- Print a Temperature to the terminal.
   -- Precondition: the Temperature has been initialized.
   -- Input: Temp, a Temperature.
   procedure Put(Temp: in Temperature);
   -- Raise the value of a Temperature by an amount.
   -- Precondition: the Temperature has been initialized.
   -- Input:
   --    Temp, a Temperature.
   --    Degrees, a Float; the amount to raise Temp by.
   -- Returns: a new Temperature with a raised value.
   function Raise_By(Temp: in Temperature; Degrees: in Float) return Temperature;
   -- Lower the value of a Temperature by an amount.
   -- Precondition: the Temperature has been initialized.
   -- Input:
   --    Temp, a Temperature.
   --    Degrees, a Float; the amount to lower Temp by.
   -- Returns: a new Temperature with a lowered value.
   function Lower_By(Temp: in Temperature; Degrees: in Float) return Temperature;
   -- Check if two Temperatures are equal.
   -- Precondition: both Temperatures have been initialized.
   -- Input:
   --    Temp1, a Temperature.
   --    Temp2, a Temperature.
   -- Returns: true if equal, false if not
   function Equals(Temp1, Temp2: in Temperature) return Boolean;
   -- Check if a Temperature is less than another.
   -- Precondition: both Temperatures have been initialized.
   -- Input:
   --    Temp1, a Temperature.
   --    Temp2, a Temperature.
   -- Returns: true if the first is less than the second, false if not.
   function Less_Than(Temp1, Temp2: in Temperature) return Boolean;
   
private
   KELVIN: constant Character := 'K';
   CELSIUS: constant Character := 'C';
   FAHRENHEIT: constant Character := 'F';
   
   ABSOLUTE_ZERO: constant Float := -273.15;
   
   -- Utility function to convert a Celsius value to another scale.
   -- Input:
   --    Value_Celsius, a Float.
   --    Scale, a Character.
   -- Returns: a Float.
   function Convert_Value_From_Celsius(Value_Celsius: in Float; Scale: in Character) return Float;
   -- Utility function to convert a Kelvin value to another scale.
   -- Input:
   --    Value_Kelvin, a Float.
   --    Scale, a Character.
   -- Returns: a Float.
   function Convert_Value_From_Kelvin(Value_Kelvin: in Float; Scale: in Character) return Float;
   -- Utility function to convert a Fahrenheit value to another scale.
   -- Input:
   --    Value_Fahrenheit, a Float.
   --    Scale, a Character.
   -- Returns: a Float.
   function Convert_Value_From_Fahrenheit(Value_Fahrenheit: in Float; Scale: in Character) return Float;
   -- Utility function to check if a scale character is valid.
   -- Input: Scale, a Character.
   -- Returns: true if valid, false if not.
   function Is_Scale_Valid(Scale: in Character) return Boolean;
   -- Utility function to check if a scale character is Celsius.
   -- Input: Scale, a Character.
   -- Returns: true if Celsius, false if not.
   function Is_Celsius(Scale: in Character) return Boolean;
   -- Utility function to check if a scale character is Fahrenheit.
   -- Input: Scale, a Character.
   -- Returns: true if Fahrenheit, false if not.
   function Is_Fahrenheit(Scale: in Character) return Boolean;
   -- Utility function to check if a scale character is Kelvin.
   -- Input: Scale, a Character.
   -- Returns: true if Kelvin, false if not.
   function Is_Kelvin(Scale: in Character) return Boolean;
   -- Utility function to convert a Temperature to any scale.
   -- Precondition: the Temperature has been initialized.
   -- Input:
   --    Temp, a Temperature.
   --    Scale, a Character. Must be one of: K,k,F,f,C,c
   -- Returns: a new Temperature of the specified scale.
   function Convert_Temp(Temp: in Temperature; Scale: in Character) return Temperature;
   
   type Temperature is
      record
	 Value: Float;
	 Scale: Character;
      end record;
	 
end Temperature_Package;
