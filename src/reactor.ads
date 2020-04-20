package reactor with SPARK_Mode is

   type Temperature is range 0..100;
   type Rods is range 1..5;
   type ReactorStatus is (Running, Overheated);
   OverheatThreshold : constant Temperature := 75;
   TempIncrement : constant Temperature := 10;

   type TrainReactor is tagged record
      temp : Temperature;
      status : ReactorStatus;
   end record;

   procedure Update (
