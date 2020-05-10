--with Ada.Text_IO; use Ada.Text_IO;

package body waterTank with SPARK_Mode is


   function returnWaterStatus(This : in TrainWaterTank) return WaterLevel is
   begin
      return this.water_level;
   end returnWaterStatus;

  end waterTank;
