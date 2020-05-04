package reactor with SPARK_Mode is

   type Power is range 0..5200;
   type PowerArray is array (Power) of Integer;
   type Rods is range 1..5;
   type RodsrArray is array (Rods) of Integer;
   type StatusOnOff is (On, Off);
   type ReactorStatus is (Running, Stop, Maintenance);

   type Temperature is range 0..100;
   OverheatThreshold : constant Temperature := 75;
   OverheatLimitThreshold : constant Temperature := 80;
   TempIncrement : constant Temperature := 10;



   type TrainReactor is record
      OnOff : StatusOnOff := Off;
      temp : Temperature := 20;
      rod_number : Rods := 5;
      status : ReactorStatus := Running;
      pow : Power := 0;
   end record;

   procedure EngineOn (This : in out TrainReactor) with
     Pre => This.OnOff = Off and then This.rod_number = Rods'Last,
     Post => This.OnOff = On and then This.rod_number = Rods'Last;

   procedure EngineOff (This : in out TrainReactor) with
     Pre => This.OnOff = On and then This.rod_number = Rods'Last,
     Post => This.OnOff = Off and then This.rod_number = Rods'Last;

   function calculatePower (This : in TrainReactor) return Power with
     Pre => This.OnOff = On,
     Post => calculatePower'Result >= PowerArray'First and calculatePower'Result <= PowerArray'Last;



end reactor;
