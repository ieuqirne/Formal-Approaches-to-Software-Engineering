with reactor; use reactor;

package train with SPARK_Mode is

   type Speed is range 0..100;

   type Weight is range 0..22000;
   ReactorWeight : constant Weight := 2000;

   CarriageWeight : constant Weight := 1000;

   type Carriage is range 0..20;

   type Train is record
      reac : reactor.TrainReactor;
      sp : Speed := 0;
      wei : Weight := ReactorWeight;
      numbCarri : Carriage := 0;
   end record;


   procedure calculateSpeed (This : in out Train)  with
     Pre=> this.wei >= Weight'First and this.wei <= Weight'Last and This.reac.OnOff = Off and
     this.reac.pow >= Power'First and this.reac.pow <= Power'Last ,
     Post => This.sp >= Speed'First and This.sp <= Speed'Last;

--     procedure Update (This : in out Train)  with
--       --Pre => This.reac.OnOff = On,
--       Post => This.sp >= Speed'First and This.sp <= Speed'Last;

   procedure addCarriage (This : in out Train) with
     Pre => This.reac.OnOff = Off and This.numbCarri < Carriage'Last,
     Post => This.numbCarri > This.numbCarri'Old;

   function calculateWeight (This : in Train) return Weight with
     Pre => This.reac.OnOff = Off and This.wei >= Weight'First and This.wei <= Weight'Last,
     Post => calculateWeight'Result >=Weight'First and calculateWeight'Result <= Weight'Last;
end Train;
