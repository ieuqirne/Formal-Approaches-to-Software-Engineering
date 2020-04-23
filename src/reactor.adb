with Ada.Text_IO; use Ada.Text_IO;

package body reactor with SPARK_Mode is

   procedure EngineOn (This : in out TrainReactor) is
   begin
      if This.OnOff = Off and This.rod_number = Rods'Last then
         This.OnOff := On;
         This.pow := calculatePower(This);
      end if;
   end EngineOn;

   procedure EngineOff (This : in out TrainReactor) is
   begin
      This.OnOff := Off;

   end EngineOff;

   procedure decreaseRod (This : in out TrainReactor) is
   begin
      if This.OnOff = On and  This.rod_number > Rods'First then
         This.rod_number := This.rod_number - 1;
         This.pow := calculatePower(This);

         --calculateSpeed(This);
      end if;

   end decreaseRod;

   procedure addRod (This : in out TrainReactor) is
   begin
      if This.OnOff = On and  This.rod_number < Rods'Last then
         This.rod_number := This.rod_number + 1;
         This.pow := calculatePower(This);
         --calculateSpeed(This);
      end if;

   end addRod;

   function calculatePower(This : in TrainReactor) return Power
   is
      Pow : Power;
      MaxPow : Power := PowerArray'Last;
      MaxRod : Power := Power(Rods'Last);
   begin
      --Pow  := MaxPow - Power(This.rod_number);
      --Pow := MaxRod - Power(This.rod_number);
      Pow  := MaxPow / MaxRod * ((MaxRod + 1) - Power(This.rod_number));

      return Pow;
      --return MaxPow;
   end calculatePower;

end reactor;
