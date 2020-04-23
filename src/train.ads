with reactor; use reactor;

package train with SPARK_Mode is

   type Speed is range 0..1000;

   type Weight is range 0..10000;
   type Carriage is range 0..20;

   type Train is record
      reac : reactor.TrainReactor;
      sp : Speed := 0;
      wei : Weight := 5200;
      NumbCarri : Carriage := 0;
   end record;


   procedure calculateSpeed (This : in out Train)  with
     Post => This.sp >= Speed'First and This.sp <= Speed'Last;


end Train;
