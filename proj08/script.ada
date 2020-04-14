
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj08[david@davidreidsma proj08]$ cd ada
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj08/ada[david@davidreidsma ada]$ cat temperature_tester.adb temperature_package.ads temperature_package.adb
-- Driver for the Temperature type.
-- Author: David Reidsma
-- Date: 04/12/2020

with Ada.Text_IO, Ada.Float_Text_IO, Temperature_Package;
use Ada.Text_IO, Ada.Float_Text_IO, Temperature_Package;

procedure Temperature_Tester is
   Start: Temperature_Package.Temperature;
   Start_Scale: Character;
   Stop: Temperature_Package.Temperature;
   Step: Float;
   Error: Boolean := False;
   Current: Temperature_Package.Temperature;
begin
   Put("Enter a start temperature: ");
   Start := Temperature_Package.Read_Temp(Error);
   Start_Scale := Temperature_Package.Get_Scale(Start);
   
   Put("Enter a stop temperature: ");
   Stop := Temperature_Package.Read_Temp(Error);
   
   Put("Enter a step amount of degrees (in the same scale as your start temperature): ");
   Get(Step);
   
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
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj08/ada[david@davidreidsma ada]$ make
make: 'temperature_tester' is up to date.
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj08/ada[david@davidreidsma ada]$ ./temperature_tester 
Enter a start temperature: 0 F
Enter a stop temperature: 100 C
Enter a step amount of degrees (in the same scale as your start temperature): 2.5

0.000 F       -17.778 C     255.372 K
2.500 F       -16.389 C     256.761 K
5.000 F       -15.000 C     258.150 K
7.500 F       -13.611 C     259.539 K
10.000 F      -12.222 C     260.928 K
12.500 F      -10.833 C     262.317 K
15.000 F      -9.444 C      263.706 K
17.500 F      -8.056 C      265.094 K
20.000 F      -6.667 C      266.483 K
22.500 F      -5.278 C      267.872 K
25.000 F      -3.889 C      269.261 K
27.500 F      -2.500 C      270.650 K
30.000 F      -1.111 C      272.039 K
32.500 F      0.278 C       273.428 K
35.000 F      1.667 C       274.817 K
37.500 F      3.056 C       276.206 K
40.000 F      4.444 C       277.594 K
42.500 F      5.833 C       278.983 K
45.000 F      7.222 C       280.372 K
47.500 F      8.611 C       281.761 K
50.000 F      10.000 C      283.150 K
52.500 F      11.389 C      284.539 K
55.000 F      12.778 C      285.928 K
57.500 F      14.167 C      287.317 K
60.000 F      15.556 C      288.706 K
62.500 F      16.944 C      290.094 K
65.000 F      18.333 C      291.483 K
67.500 F      19.722 C      292.872 K
70.000 F      21.111 C      294.261 K
72.500 F      22.500 C      295.650 K
75.000 F      23.889 C      297.039 K
77.500 F      25.278 C      298.428 K
80.000 F      26.667 C      299.817 K
82.500 F      28.056 C      301.206 K
85.000 F      29.444 C      302.594 K
87.500 F      30.833 C      303.983 K
90.000 F      32.222 C      305.372 K
92.500 F      33.611 C      306.761 K
95.000 F      35.000 C      308.150 K
97.500 F      36.389 C      309.539 K
100.000 F     37.778 C      310.928 K
102.500 F     39.167 C      312.317 K
105.000 F     40.556 C      313.706 K
107.500 F     41.944 C      315.094 K
110.000 F     43.333 C      316.483 K
112.500 F     44.722 C      317.872 K
115.000 F     46.111 C      319.261 K
117.500 F     47.500 C      320.650 K
120.000 F     48.889 C      322.039 K
122.500 F     50.278 C      323.428 K
125.000 F     51.667 C      324.817 K
127.500 F     53.056 C      326.206 K
130.000 F     54.444 C      327.594 K
132.500 F     55.833 C      328.983 K
135.000 F     57.222 C      330.372 K
137.500 F     58.611 C      331.761 K
140.000 F     60.000 C      333.150 K
142.500 F     61.389 C      334.539 K
145.000 F     62.778 C      335.928 K
147.500 F     64.167 C      337.317 K
150.000 F     65.556 C      338.706 K
152.500 F     66.944 C      340.094 K
155.000 F     68.333 C      341.483 K
157.500 F     69.722 C      342.872 K
160.000 F     71.111 C      344.261 K
162.500 F     72.500 C      345.650 K
165.000 F     73.889 C      347.039 K
167.500 F     75.278 C      348.428 K
170.000 F     76.667 C      349.817 K
172.500 F     78.056 C      351.206 K
175.000 F     79.444 C      352.594 K
177.500 F     80.833 C      353.983 K
180.000 F     82.222 C      355.372 K
182.500 F     83.611 C      356.761 K
185.000 F     85.000 C      358.150 K
187.500 F     86.389 C      359.539 K
190.000 F     87.778 C      360.928 K
192.500 F     89.167 C      362.317 K
195.000 F     90.556 C      363.706 K
197.500 F     91.944 C      365.094 K
200.000 F     93.333 C      366.483 K
202.500 F     94.722 C      367.872 K
205.000 F     96.111 C      369.261 K
207.500 F     97.500 C      370.650 K
210.000 F     98.889 C      372.039 K
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj08/ada[david@davidreidsma ada]$ ./temperature_tester 
Enter a start temperature: 0 K
Enter a stop temperature: 212 F
Enter a step amount of degrees (in the same scale as your start temperature): 20.0

-459.670 F    -273.150 C    0.000 K
-423.670 F    -253.150 C    20.000 K
-387.670 F    -233.150 C    40.000 K
-351.670 F    -213.150 C    60.000 K
-315.670 F    -193.150 C    80.000 K
-279.670 F    -173.150 C    100.000 K
-243.670 F    -153.150 C    120.000 K
-207.670 F    -133.150 C    140.000 K
-171.670 F    -113.150 C    160.000 K
-135.670 F    -93.150 C     180.000 K
-99.670 F     -73.150 C     200.000 K
-63.670 F     -53.150 C     220.000 K
-27.670 F     -33.150 C     240.000 K
8.330 F       -13.150 C     260.000 K
44.330 F      6.850 C       280.000 K
80.330 F      26.850 C      300.000 K
116.330 F     46.850 C      320.000 K
152.330 F     66.850 C      340.000 K
188.330 F     86.850 C      360.000 K
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj08/ada[david@davidreidsma ada]$ cd ..
]0;david@davidreidsma:~/Programming/Calvin/cs214/proj08[david@davidreidsma proj08]$ exit


