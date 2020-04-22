with Ada.Text_IO; use Ada.Text_IO;

package body reactor with SPARK_Mode is

   procedure EngineOn is
   begin
      if T_Reactor.OnOff = Off and T_Reactor.rod_number = Rods'Last then
         T_Reactor.OnOff := On;
      end if;
   end EngineOn;

   procedure EngineOff is
   begin
      T_Reactor.OnOff := Off;
   end EngineOff;

   procedure decreaseRod is
   begin
      if T_Reactor.OnOff = On and  T_Reactor.rod_number > Rods'First then
         T_Reactor.rod_number := T_Reactor.rod_number - 1;
      end if;

   end decreaseRod;

   procedure addRod is
   begin
      if T_Reactor.OnOff = On and  T_Reactor.rod_number < Rods'Last then
         T_Reactor.rod_number := T_Reactor.rod_number + 1;
      end if;

   end addRod;

   function calculatePower return Power
   is
      Pow : Power;
      MaxPow : Power := PowerArray'Last;
      MaxRod : Power := Power(Rods'Last);
   begin
      --Pow  := MaxPow - Power(T_Reactor.rod_number);
      --Pow := MaxRod - Power(T_Reactor.rod_number);
      Pow  := MaxPow / MaxRod * ((MaxRod + 1) - Power(T_Reactor.rod_number));

      return Pow;
      --return MaxPow;
   end calculatePower;

end reactor;
