with train; use train;
with reactor; use reactor;
with waterTank; use waterTank;

with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   --reac: reactor.TrainReactor;
   tren: train.Train;
begin


   Put_Line("OnOff");
   Put_Line(tren.reac.OnOff'Image);
   Put_Line("1. Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image & ". Weight: " & tren.wei'Image & ". Carriages: " & tren.numbCarri'Image & ". Tempe: " & tren.reac.temp'Image & ". Water Tank: " & tren.waTank.water_level'Image & ". Water Reactor: " & tren.waterInReactor'Image);
   addCarriage(tren);
   Put_Line("2. Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image & ". Weight: " & tren.wei'Image & ". Carriages: " & tren.numbCarri'Image & ". Tempe: " & tren.reac.temp'Image & ". Water Tank: " & tren.waTank.water_level'Image & ". Water Reactor: " & tren.waterInReactor'Image);
   decreaseCarriage(tren);
   Put_Line("3. Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image & ". Weight: " & tren.wei'Image & ". Carriages: " & tren.numbCarri'Image & ". Tempe: " & tren.reac.temp'Image & ". Water Tank: " & tren.waTank.water_level'Image & ". Water Reactor: " & tren.waterInReactor'Image);

   --calculateWeight(tren);
   EngineOn(tren.reac);
   Put_Line(tren.reac.OnOff'Image);
   --calculatePower(tren.reac);
   ----calculateSpeed(tren);
   --(tren);
   Put_Line("4. Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image & ". Weight: " & tren.wei'Image & ". Carriages: " & tren.numbCarri'Image & ". Tempe: " & tren.reac.temp'Image & ". Water Tank: " & tren.waTank.water_level'Image & ". Water Reactor: " & tren.waterInReactor'Image);
   decreaseRod(tren);
   balanceWaterReactor(tren);
   --checkOverHeat(tren);

   --Update(tren);
   --addWaterReactor(tren);
   Put_Line("5. Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image & ". Weight: " & tren.wei'Image & ". Carriages: " & tren.numbCarri'Image & ". Tempe: " & tren.reac.temp'Image & ". Water Tank: " & tren.waTank.water_level'Image & ". Water Reactor: " & tren.waterInReactor'Image);
   decreaseRod(tren);
   balanceWaterReactor(tren);
   --checkOverHeat(tren);

   --Update(tren);
   Put_Line("6. Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image & ". Weight: " & tren.wei'Image & ". Carriages: " & tren.numbCarri'Image & ". Tempe: " & tren.reac.temp'Image & ". Water Tank: " & tren.waTank.water_level'Image & ". Water Reactor: " & tren.waterInReactor'Image);
   decreaseRod(tren);
   balanceWaterReactor(tren);
   --checkOverHeat(tren);


   --Update(tren);
   Put_Line("7. Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image & ". Weight: " & tren.wei'Image & ". Carriages: " & tren.numbCarri'Image & ". Tempe: " & tren.reac.temp'Image & ". Water Tank: " & tren.waTank.water_level'Image & ". Water Reactor: " & tren.waterInReactor'Image);
   decreaseRod(tren);
   balanceWaterReactor(tren);
   --checkOverHeat(tren);

   Put_Line("8. Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image & ". Weight: " & tren.wei'Image & ". Carriages: " & tren.numbCarri'Image & ". Tempe: " & tren.reac.temp'Image & ". Water Tank: " & tren.waTank.water_level'Image & ". Water Reactor: " & tren.waterInReactor'Image);
   addRod(tren);
   balanceWaterReactor(tren);
   --checkOverHeat(tren);

   Put_Line("9. Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image & ". Weight: " & tren.wei'Image & ". Carriages: " & tren.numbCarri'Image & ". Tempe: " & tren.reac.temp'Image & ". Water Tank: " & tren.waTank.water_level'Image & ". Water Reactor: " & tren.waterInReactor'Image);
   addRod(tren);
   balanceWaterReactor(tren);
   --checkOverHeat(tren);

   Put_Line("10. Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image & ". Weight: " & tren.wei'Image & ". Carriages: " & tren.numbCarri'Image & ". Tempe: " & tren.reac.temp'Image & ". Water Tank: " & tren.waTank.water_level'Image & ". Water Reactor: " & tren.waterInReactor'Image);
   addRod(tren);
   balanceWaterReactor(tren);
   --checkOverHeat(tren);

   Put_Line("11. Rods: " & tren.reac.rod_number'Image & ". Power: " &  calculatePower(tren.reac)'Image & ". Speed: " & tren.sp'Image & ". Weight: " & tren.wei'Image & ". Carriages: " & tren.numbCarri'Image & ". Tempe: " & tren.reac.temp'Image & ". Water Tank: " & tren.waTank.water_level'Image & ". Water: " & tren.waterInReactor'Image);
   --decreaseRod;
   --Put_Line("Rods: " & T_Reactor.rod_number'Image & ". Power: " & calculatePower'Image);
end Main;
