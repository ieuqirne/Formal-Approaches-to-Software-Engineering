with Ada.Text_IO; use Ada.Text_IO;

package body waterTank with SPARK_Mode is

   procedure UpdateWaterStatus (This : in out TrainWaterTank) is
   begin
      if This.water_level <= WaterLevel'Last and This.water_level > WaterThreshold then
         This.status := Sufficient;
      elsif This.water_level <= WaterThreshold and This.water_level >= WaterLevel'First then
         This.status := Critical;
         Ada.Text_IO.Put_Line("Water level critical!");
      end if;
   end UpdateWaterStatus;

   procedure UpdateWaterLevel ( This : in out TrainWaterTank; lvl : in WaterLevel) is
   begin
      This.water_level := lvl;
      This.UpdateWaterStatus;
   end UpdateWaterLevel;

   procedure Update (This : in out TrainWaterTank) is
   begin
      if This.water_level > WaterDecrement then
         This.water_level := This.water_level - WaterDecrement;
         This.UpdateWaterStatus;
      end if;
   end update;

   function ConstructWaterTank return TrainWaterTank is
      result : TrainWaterTank := (status => (Sufficient), water_level => (5600));
   begin
      return result;
      end ConstructWaterTank;

end waterTank;
