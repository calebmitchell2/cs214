package Temperature_Package is
   type Temperature is private;
   
   procedure Init(Temp: out Temperature; Value: in Float; Scale: in Character);
   function Get_Value(Temp: in Temperature) return Float;
   function Get_Scale(Temp: in Temperature) return Character;
   function To_Kelvin(Temp: in Temperature) return Temperature;
   function To_Celsius(Temp: in Temperature) return Temperature;
   function To_Fahrenheit(Temp: in Temperature) return Temperature;
   function Read_Temp return Temperature;
   procedure Put(Temp: in Temperature);
   function Raise(Temp: in Temperature; Degrees: in Float) return Temperature;
   function Lower(Temp: in Temperature; Degrees: in Float) return Temperature;
   function Equals(Temp1, Temp2: in Temperature) return Boolean;
   function Less_Than(Temp1, Temp2: in Temperature) return Boolean;
   
private
   KELVIN: constant Character := 'K';
   CELSIUS: constant Character := 'C';
   FAHRENHEIT: constant Character := 'F';
   
   ABSOLUTE_ZERO: constant Float := -273.15;
   
   -- rename the next three to "Convert_?????_Value"
   function Celsius_To_Other(Value_Celsius: in Float; Scale: in Character) return Float;
   function Kelvin_To_Other(Value_Kelvin: in Float; Scale: in Character) return Float;
   function Fahrenheit_To_Other(Value_Fahrenheit: in Float; Scale: in Character) return Float;
   function Is_Valid(Value: in Float; Scale: in Character) return Boolean;
   function Is_Celsius(Scale: in Character) return Boolean;
   function Is_Fahrenheit(Scale: in Character) return Boolean;
   function Is_Kelvin(Scale: in Character) return Boolean;
   function Convert_Temp(Temp: in Temperature; Scale: in Character) return Temperature;
   
   type Temperature is
      record
	 Value: Float;
	 Scale: Character;
      end record;
	 
end Temperature_Package;
