-- Your challenge for today is to create a calculator application that has use in your life.
--For example, if you were in physics class, you might want to make a F = M * A calc.
--EXTRA CREDIT: make the calculator have multiple functions!
--Not only should it be able to calculate F = M * A, but also A = F/M, and M = F/A!

with Ada.Text_IO,ada.Integer_Text_IO, Ada.Strings.Unbounded,
     Ada.Text_IO.Unbounded_IO;

use  Ada.Text_IO,ada.Integer_Text_IO,Ada.Strings.Unbounded,
    Ada.Text_IO.Unbounded_IO;

procedure challenge2 is
   Force:Integer;
   Mass:Positive;
   Acceleration:Integer;
   PressedKey: Integer range  1..4;
   function calculateForce(Mass:Positive;Acceleration:Integer) return Integer is
   begin

      Force:=Mass * Acceleration;
      return Force;
   end calculateForce;
   function calculateMass(Force:Integer;Acceleration:Integer) return Integer is
   begin

      Mass:=Force / Acceleration;
      return Mass;
   end calculateMass;
   function calculateAcceleration(Force:Integer;Mass:Positive) return Integer is
   begin

      Acceleration:=Force /  Mass;
      return Acceleration;
   end calculateAcceleration;

begin
   loop
      Put_Line("press 1 to calculate Force,2 to calculate Mass or 3 to calculate acceleration, OR 4 to exit");
      Get(PressedKey);
      case PressedKey is
      when 1 =>Put_Line("You are calculating the force4");
         Put_Line("please enter the mass");
         Get(Mass);
         Put_Line("please enter the acceleration");
         Get(Acceleration);
         Force:=calculateForce(Mass,Acceleration);
         Put_Line("The force is " &Integer'Image(Force));
      when 2=>Put_Line("please enter the force");
         Get(Force);
         Put_Line("please enter the acceleration");
         Get(Acceleration);
         Mass:=calculateMass(Force,Acceleration);
         Put_Line("The Mass is " &Integer'Image(Mass));
      when 3 =>Put_Line("please enter the force");
         Get(Force);
         Put_Line("please enter the mass");
         Get(Mass);
         Acceleration:=calculateAcceleration(Force,Mass);
         Put_Line("The acceleration is " & Integer'Image(Acceleration));
         when 4 =>exit;
      end case;
   end loop;
end challenge2;
