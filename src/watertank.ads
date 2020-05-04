  package waterTank with SPARK_Mode is

   type WaterLevel is range 0..1500;
   --type InjectingClosed is (Injecting, Closed);
   type WaterStatus is (Critical, Sufficient);

   WaterThreshold: constant WaterLevel :=500;
   WaterDecrement: constant WaterLevel :=100;

   type TrainWaterTank is record
      water_level : WaterLevel := WaterLevel'Last;
      status : WaterStatus := Sufficient;
   end record;

   function returnWaterStatus (This : in TrainWaterTank) return WaterLevel with
     Pre => This.water_level  >= WaterLevel'First and This.water_level <= WaterLevel'Last,
     Post => returnWaterStatus'Result >= WaterLevel'First and returnWaterStatus'Result <= WaterLevel'Last;

  end waterTank;
