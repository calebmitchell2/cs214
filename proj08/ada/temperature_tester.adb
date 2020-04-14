with Ada.Text_IO, Temperature_Package;
use Ada.Text_IO, Temperature_Package;

procedure Temperature_Tester is
   Celsius: Temperature_Package.Temperature;
   Fahrenheit: Temperature_Package.Temperature;
   Kelvin: Temperature_Package.Temperature;
begin
   Celsius := Temperature_Package.Read_Temp;
   Put(Celsius);
end Temperature_Tester;
