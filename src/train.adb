with reactor; use reactor;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body train with SPARK_Mode is

   function calculateSpeed (This : in Train) return Speed is
      SpFloat : Float;
      Spee : Speed;
   begin

      if(This.reac.pow = 0) then
         SpFloat := 0.0;
      else
         SpFloat := Float(This.reac.pow) / Float(This.wei) * 100.0;
      end if;

      if(SpFloat > 100.00) then
        Spee := 100;
      elsif (SpFloat = 0.0) then
           Spee := 0;
      else
        Spee := Speed(SpFloat);
      end if;

      return Spee;
   end calculateSpeed;

   procedure addCarriage (This : in out Train) is
   begin
      if This.reac.OnOff = Off and  This.numbCarri < Carriage'Last then
         This.numbCarri := This.numbCarri + 1;
         This.wei := calculateWeight(This);
      end if;

   end addCarriage;

   procedure decreaseCarriage (This : in out Train) is
   begin
      if This.reac.OnOff = Off and  This.numbCarri > Carriage'First then
         This.numbCarri := This.numbCarri - 1;
         This.wei := calculateWeight(This);
      end if;

   end decreaseCarriage;

   procedure addRod (This : in out Train) is
   begin
         This.reac.rod_number := This.reac.rod_number + 1;
         This.reac.pow := calculatePower(This.reac);
         This.sp := calculateSpeed(This);
         This.reac.temp := calcTemp(This);
   end addRod;

   procedure decreaseRod (This : in out Train) is
   begin
      if This.reac.OnOff = On and  This.reac.rod_number > Rods'First then
         This.reac.rod_number := This.reac.rod_number - 1;
         This.reac.pow := calculatePower(This.reac);
         This.sp := calculateSpeed(This);
         This.reac.temp := calcTemp(This);
      end if;
   end decreaseRod;


   function calculateWeight (This : in Train) return Weight
   is
      ret : Weight;
   begin
      if(This.numbCarri = 0) then
         ret := ReactorWeight;
      else
         ret :=  ReactorWeight + Weight(Integer(CarriageWeight) * Integer(this.numbCarri));
      end if;

      return ret;
   end calculateWeight;

   function calcTemp (This : in Train) return Temperature
   is
      tempe : Temperature;
   begin
      if(This.reac.OnOff = Off) then
         return 15;
      end if;
      tempe := Temperature'Last / Temperature(Rods'Last) * Temperature(Rods'Last - This.reac.rod_number + 1);

      if(tempe >= OverheatThreshold) then
               tempe := Temperature'Last / Temperature(Rods'Last) * Temperature(Rods'Last - This.reac.rod_number + 1) - Temperature(this.waterInReactor /100);
      end if;

      return tempe;
   end calcTemp;

   procedure balanceWaterReactor (This : in out Train) is
      tempe : Temperature;
   begin
      if(this.reac.temp >= OverheatThreshold  ) then
         tempe := This.reac.temp - OverheatThreshold;
         if(this.waTank.water_level >= WaterDecrement * WaterLevel(tempe) and
              this.waterInReactor <= WaterLevel'Last - WaterDecrement * WaterLevel(tempe) ) then
            This.waterInReactor := This.waterInReactor + WaterDecrement * WaterLevel(tempe);
            This.waTank.water_level := WaterLevel'Last - This.waterInReactor;
         else
            This.waterInReactor := WaterLevel'Last;
            This.waTank.water_level := WaterLevel'First;
         end if;
      else
         This.waterInReactor := WaterLevel'First;
         This.waTank.water_level := WaterLevel'Last;

      end if;

      This.reac.temp := calcTemp(This);

      if(This.reac.temp > OverheatLimitThreshold) then
         overHeat(This);
      end if;

      if(This.waTank.water_level > WaterThreshold) then
         This.waTank.status := Sufficient;
      else
         This.waTank.status := Critical;
      end if;

   end balanceWaterReactor;


   procedure overHeat (This : in out Train) is
   begin
      this.reac.OnOff := Off;
      this.reac.rod_number := reactor.Rods'Last;
      this.reac.status := Overheated;
      This.reac.pow := 0;
      This.sp := 0;
      this.reac.temp := 15;
   end overHeat;

   procedure trainToMaintenance (This : in out Train) is
   begin
      this.reac.status := Maintenance;
      This.reac.pow := calculatePower(This.reac);
   end trainToMaintenance;

end train;
