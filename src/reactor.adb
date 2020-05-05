with Ada.Text_IO; use Ada.Text_IO;

package body reactor with SPARK_Mode is

   procedure EngineOn (This : in out TrainReactor) is
   begin
      if This.OnOff = Off and This.rod_number = Rods'Last then
         This.OnOff := On;
         This.pow := calculatePower(This);
         This.status := Running;
      end if;
   end EngineOn;

   procedure EngineOff (This : in out TrainReactor) is
   begin
      This.OnOff := Off;
      This.status := Stop;
      This.pow := calculatePower(This);
   end EngineOff;

   function calculatePower(This : in TrainReactor) return Power
   is
      Pow : Power;
      MaxPow : Power := PowerArray'Last;
      MaxRod : Power := Power(Rods'Last);
   begin
      Pow  := MaxPow / MaxRod * ((MaxRod + 1) - Power(This.rod_number));
      if(this.OnOff = Off) then
         return 0;
      end if;

      return Pow;
   end calculatePower;

end reactor;
