with train; use train;
with reactor; use reactor;
with waterTank; use waterTank;

with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   tren: train.Train;
   procedure PrintStatus is
   begin
      New_Line;
      Put_Line("...........................");
      Put_Line("Engine: " & tren.reac.OnOff'Image);
      Put_Line("Status: " & tren.reac.status'Image);
      Put_Line("Rods Number: " & tren.reac.rod_number'Image);
      Put_Line("Power: " & tren.reac.pow'Image);
      Put_Line("Temperature: " & tren.reac.temp'Image);
      Put_Line("Speed: " & tren.sp'Image);
      Put_Line("Number Carriages: " & tren.numbCarri'Image);
      Put_Line("Total Weight: " & tren.wei'Image);
      Put_Line("Water In Reactor: " & tren.waterInReactor'Image);
      Put_Line("Water Left Tank: " & tren.waTank.water_level'Image);
      Put_Line("Tank Status: " & tren.waTank.status'Image);
      Put_Line("...........................");
      New_Line;
      --delay 2.0;
   end PrintStatus;

   procedure ClearDelay is
   begin
      delay 0.0;
      --Ada.Text_IO.Put(ASCII.ESC & "[2J");
   end ClearDelay;

begin
   PrintStatus;
   New_Line;

   Put_Line("Adding carriage...");
   ClearDelay;
   addCarriage(tren);
   PrintStatus;

   Put_Line("Adding carriage...");
   ClearDelay;
   addCarriage(tren);
   PrintStatus;

   Put_Line("Engine On...");
   ClearDelay;
   EngineOn(tren.reac);
   PrintStatus;

   Put_Line("Decreasing Rod...");
   ClearDelay;
   decreaseRod(tren);
   balanceWaterReactor(tren);
   PrintStatus;

   Put_Line("Decreasing Rod...");
   ClearDelay;
   decreaseRod(tren);
   balanceWaterReactor(tren);
   PrintStatus;

   Put_Line("Decreasing Rod...");
   ClearDelay;
   decreaseRod(tren);
   balanceWaterReactor(tren);
   PrintStatus;

   Put_Line("Decreasing Rod...");
   ClearDelay;
   decreaseRod(tren);
   balanceWaterReactor(tren);
   PrintStatus;

   Put_Line("Engine On...");
   ClearDelay;
   EngineOn(tren.reac);
   PrintStatus;

   Put_Line("Engine Off...");
   ClearDelay;
   EngineOff(tren.reac);
   PrintStatus;

   Put_Line("Maintenance...");
   ClearDelay;
   trainToMaintenance(tren);
   balanceWaterReactor(tren);
   PrintStatus;

   Put_Line("Decreasing Carriages...");
   ClearDelay;
   decreaseCarriage(tren);
   balanceWaterReactor(tren);
   PrintStatus;

   Put_Line("Decreasing Carriages...");
   ClearDelay;
   decreaseCarriage(tren);
   balanceWaterReactor(tren);
   PrintStatus;

   Put_Line("Decreasing Carriages...");
   ClearDelay;
   decreaseCarriage(tren);
   balanceWaterReactor(tren);
   PrintStatus;

   Put_Line("Engine On...");
   ClearDelay;
   EngineOn(tren.reac);
   PrintStatus;

   Put_Line("Decreasing Rod...");
   ClearDelay;
   decreaseRod(tren);
   balanceWaterReactor(tren);
   PrintStatus;

   Put_Line("Decreasing Rod...");
   ClearDelay;
   decreaseRod(tren);
   balanceWaterReactor(tren);
   PrintStatus;
end Main;
