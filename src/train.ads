with reactor; use reactor;

package train with SPARK_Mode is

   type Speed is range 0..100;

   type Weight is range 2000..22000;
   ReactorWeight : constant Weight := 2000;

   CarriageWeight : constant Weight := 2000;

   type Carriage is range 0..10;

   type Train is record
      reac : reactor.TrainReactor;
      sp : Speed := 0;
      wei : Weight := ReactorWeight;
      numbCarri : Carriage := 0;
   end record;


   function calculateSpeed (This : in Train) return Speed with
     Pre=> this.wei >= Weight'First and this.wei <= Weight'Last and
     this.reac.pow >= Power'First and this.reac.pow <= Power'Last ,
     Post => calculateSpeed'Result >= Speed'First  and calculateSpeed'Result <= Speed'Last;

--     procedure Update (This : in out Train)  with
--       --Pre => This.reac.OnOff = On,
--       Post => This.sp >= Speed'First and This.sp <= Speed'Last;

   procedure addCarriage (This : in out Train) with
     Pre => This.reac.OnOff = Off and This.numbCarri < Carriage'Last,
     Post => This.numbCarri > This.numbCarri'Old;

   procedure decreaseCarriage (This : in out Train) with
     Pre => This.reac.OnOff = Off and This.numbCarri > Carriage'First,
     Post => This.numbCarri < This.numbCarri'Old;

   procedure addRod (This : in out Train) with
     Pre => This.reac.OnOff = On and then This.reac.rod_number < Rods'Last,
     Post => This.reac.rod_number > This.reac.rod_number'Old;

   procedure decreaseRod (This : in out Train) with
     Pre => This.reac.OnOff = On and then This.reac.rod_number > Rods'First,
     Post => This.reac.rod_number < This.reac.rod_number'Old;

   function calculateWeight (This : in Train) return Weight with
     Pre => This.reac.OnOff = Off and This.wei >= Weight'First and This.wei <= Weight'Last,
     Post => calculateWeight'Result >= ReactorWeight and calculateWeight'Result <= Weight'Last;
end Train;
