with train; use train;
with reactor; use reactor;

with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   --reac: reactor.TrainReactor;
   tren: train.Train;
begin


   Put_Line("OnOff");
   Put_Line(tren.reac.OnOff'Image);
   --addCarriage(tren);
   calculateWeight(tren);
   EngineOn(tren.reac);
   Put_Line(tren.reac.OnOff'Image);
   --calculatePower(tren.reac);
   ----calculateSpeed(tren);
   Update(tren);
   Put_Line("Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image & ". Weight: " & tren.wei'Image& ". Carriages: " & tren.numbCarri'Image);
   decreaseRod(tren.reac);
   Update(tren);

   Put_Line("Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image & ". Weight: " & tren.wei'Image& ". Carriages: " & tren.numbCarri'Image);
   decreaseRod(tren.reac);

   Update(tren);
   Put_Line("Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image & ". Weight: " & tren.wei'Image& ". Carriages: " & tren.numbCarri'Image);
   decreaseRod(tren.reac);
   Update(tren);
   Put_Line("Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image & ". Weight: " & tren.wei'Image& ". Carriages: " & tren.numbCarri'Image);
   decreaseRod(tren.reac);
   Update(tren);
   Put_Line("Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image & ". Weight: " & tren.wei'Image& ". Carriages: " & tren.numbCarri'Image);

   --decreaseRod;
   --Put_Line("Rods: " & T_Reactor.rod_number'Image & ". Power: " & calculatePower'Image);
end Main;
