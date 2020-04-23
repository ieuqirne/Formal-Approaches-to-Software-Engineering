with train; use train;
with reactor; use reactor;

with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   --reac: reactor.TrainReactor;
   tren: train.Train;
begin


   Put_Line("OnOff");
   Put_Line(tren.reac.OnOff'Image);
   EngineOn(tren.reac);
   Put_Line(tren.reac.OnOff'Image);
   --calculatePower(tren.reac);
   ----calculateSpeed(tren);
   Put_Line("Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image);
   decreaseRod(tren.reac);

   ----calculateSpeed(tren);
   Put_Line("Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image &". Speed: " & tren.sp'Image );

   --decreaseRod;
   --Put_Line("Rods: " & T_Reactor.rod_number'Image & ". Power: " & calculatePower'Image);
end Main;
