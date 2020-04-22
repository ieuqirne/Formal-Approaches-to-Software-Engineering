with reactor; use reactor;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

begin


   Put_Line("OnOff");
   Put_Line(T_Reactor.OnOff'Image);
   Put_Line("Rods");
   Put_Line(T_Reactor.rod_number'Image);
   Put_Line("temp");
   Put_Line(T_Reactor.temp'Image);

   Put_Line("status");
   Put_Line(T_Reactor.status'Image);
   EngineOn;
   Put_Line("Rods: " & T_Reactor.rod_number'Image & ". Power: " & calculatePower'Image);
   decreaseRod;
   Put_Line("Rods: " & T_Reactor.rod_number'Image & ". Power: " & calculatePower'Image);
   decreaseRod;
   Put_Line("Rods: " & T_Reactor.rod_number'Image & ". Power: " & calculatePower'Image);
end Main;
