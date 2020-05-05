with train; use train;
with reactor; use reactor;
with waterTank; use waterTank;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is
   tren: train.Train;
   option : Integer := 1;

   procedure PrintStatus is
   begin
      Ada.Text_IO.Put(ASCII.ESC & "[2J");
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
      delay 2.0;
      --Ada.Text_IO.Put(ASCII.ESC & "[2J");
   end ClearDelay;

begin

   while option /= 0 loop

      PrintStatus;
      New_Line;
      Put_Line("Choose one of the following options: ");
      Put_Line("...........................");
      Put_Line("1. Engine On");
      Put_Line("2. Engine Off");
      Put_Line("3. Add Carriage");
      Put_Line("4. Decrease Carriage");
      Put_Line("5. Add Rod");
      Put_Line("6. Decrease Rod");
      Put_Line("7. Maintenance");
      Put_Line("0. Exit");
      Put_Line("...........................");
      New_Line;
      Ada.Integer_Text_IO.Get(option);

      case option is
         when 1 =>
            Put_Line("Engine On...");
            ClearDelay;
            EngineOn(tren.reac);
         when 2    =>
            Put_Line("Engine Off...");
            EngineOff(tren.reac);
            ClearDelay;
         when 3    =>
            Put_Line("Adding Carriage...");
            addCarriage(tren);
            balanceWaterReactor(tren);
            ClearDelay;
         when 4    =>
            Put_Line("Decreasing Carriage...");
            decreaseCarriage(tren);
            balanceWaterReactor(tren);
            ClearDelay;
         when 5    =>
            Put_Line("Adding Rod...");
            addRod(tren);
            balanceWaterReactor(tren);
            ClearDelay;
         when 6    =>
            Put_Line("Decreasing Rod...");
            decreaseRod(tren);
            balanceWaterReactor(tren);
            ClearDelay;
         when 7    =>
            Put_Line("Train To Maintenance");
            trainToMaintenance(tren);
            balanceWaterReactor(tren);
            ClearDelay;
         when 0    =>
            Put_Line ("Exiting");
            delay 2.0;

         when others => -- error has already been signaled to user
            null;
      end case;
      end loop;
end Main;
