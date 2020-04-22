with reactor; use reactor;

package Train with SPARK_Mode is

   type Speed is range 0..100;

   type Weight is range 1000-10000;
   type Carriage is range 0..20;

   type Train is record
      sp : Speed;
      wei : Weight;
      NumbCarri : Carriage;
   end record;


   --function calculateSpeed




end Train;
