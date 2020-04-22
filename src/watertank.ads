package waterTank with SPARK_Mode is

   type WaterLevel is range 0..5600;
   --type InjectingClosed is (Injecting, Closed);
   type WaterStatus is (Critical, Sufficient);

   WaterThreshold: constant WaterLevel :=500;
   WaterDecrement: constant WaterLevel :=100;

   type TrainWaterTank is record
      water_level : WaterLevel;
      status : WaterStatus;
   end record;

   procedure UpdateWaterLevel (This: in out TrainWaterTank; lvl : in WaterLevel) with
     Pre => lvl >= WaterLevel'First and lvl <= WaterLevel'Last,
     Post => This.water_level >= WaterLevel'First and This.water_level <= WaterLevel'Last,
     Contract_Cases => (lvl >= WaterThreshold and lvl <= WaterLevel'Last => This.status = Sufficient,
                        lvl < WaterThreshold and  lvl >= WaterLevel'First  => This.status = Critical);


   procedure Update (This: in out TrainWaterTank) with
     Pre => This.water_level > WaterDecrement,
     Post => This.water_level >= WaterLevel'First;

   procedure UpdateWaterStatus (This : in out TrainWaterTank) with
     Pre => This.water_level >= WaterLevel'First and This.water_level <= WaterLevel'Last,
     Contract_Cases => (This.water_level > WaterThreshold and this.water_level <= WaterLevel'Last => This.status = Sufficient,
                        This.water_level >= WaterLevel'First and this.water_level <= WaterThreshold => This.status = Critical);

   function ConstructWaterTank return TrainWaterTank;

end waterTank;
