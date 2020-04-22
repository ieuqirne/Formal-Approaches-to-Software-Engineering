package reactor with SPARK_Mode is

   type Temperature is range 0..100;

   type Power is range 0..5200;
   type PowerArray is array (Power) of Integer;
   type Rods is range 1..5;
   type RodsrArray is array (Rods) of Integer;

   type StatusOnOff is (On, Off);

   type ReactorStatus is (Running, Overheated);

   OverheatThreshold : constant Temperature := 75;

   TempIncrement : constant Temperature := 10;

   type TrainReactor is record
      OnOff : StatusOnOff;
      temp : Temperature;
      rod_number : Rods;
      status : ReactorStatus;
      pow : Power;
   end record;

   T_Reactor : TrainReactor := (OnOff => Off,
                                temp => Temperature'First,
                                rod_number => Rods'Last,
                                status => Running,
                                pow => Power'First);


   procedure EngineOn  with
     Global => (In_Out => T_Reactor),
     Pre => T_Reactor.OnOff = Off and then T_Reactor.rod_number = Rods'Last,
     Post => T_Reactor.OnOff = On and then T_Reactor.rod_number = Rods'Last;

   procedure EngineOff with
     Global => (In_Out => T_Reactor),
     Pre => T_Reactor.OnOff = On and then T_Reactor.rod_number = Rods'Last,
     Post => T_Reactor.OnOff = Off and then T_Reactor.rod_number = Rods'Last;


   procedure decreaseRod  with
     Global => (In_Out => T_Reactor),
     Pre => T_Reactor.OnOff = On and then T_Reactor.rod_number > Rods'First,
     Post => T_Reactor.rod_number < T_Reactor.rod_number'Old;
   procedure addRod  with
     Global => (In_Out => T_Reactor),
     Pre => T_Reactor.OnOff = On and then T_Reactor.rod_number < Rods'Last,
     Post => T_Reactor.rod_number > T_Reactor.rod_number'Old;

   function calculatePower  return Power with
     Post => calculatePower'Result >= PowerArray'First and calculatePower'Result <= PowerArray'Last;



end reactor;
