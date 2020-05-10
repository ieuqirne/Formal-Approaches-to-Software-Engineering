with reactor; use reactor;
with waterTank; use waterTank;

package train with SPARK_Mode is

   type Speed is range 0..100;

   type Weight is range 2000..22000;
   ReactorWeight : constant Weight := 2000;
   CarriageWeight : constant Weight := 2000;

   type Carriage is range 0..10;
   waterneeded : waterTank.WaterLevel;

   type Train is record
      reac : reactor.TrainReactor;
      waTank : waterTank.TrainWaterTank;
      sp : Speed := 0;
      wei : Weight := ReactorWeight;
      numbCarri : Carriage := 0;
      waterInReactor : waterTank.WaterLevel:= 0;
   end record;

   function calculateSpeed (This : in Train) return Speed with
     Pre=> this.wei >= Weight'First and this.wei <= Weight'Last and
     this.reac.pow >= Power'First and this.reac.pow <= Power'Last ,
     Post => calculateSpeed'Result >= Speed'First  and calculateSpeed'Result <= Speed'Last;

   procedure addCarriage (This : in out Train) with
     Pre => This.reac.OnOff = Off and This.numbCarri < Carriage'Last,
     Post => This.numbCarri > This.numbCarri'Old;

   procedure decreaseCarriage (This : in out Train) with
     Pre => This.reac.OnOff = Off and This.numbCarri > Carriage'First,
     Post => This.numbCarri < This.numbCarri'Old;

   procedure addRod (This : in out Train) with
     Pre => This.reac.OnOff = On and This.reac.rod_number >= Rods'First and This.reac.rod_number < Rods'Last,
     Post => This.reac.rod_number > This.reac.rod_number'Old and this.reac.rod_number <= Rods'Last;

   procedure decreaseRod (This : in out Train) with
     Pre => This.reac.OnOff = On and then This.reac.rod_number > Rods'First,
     Post => This.reac.rod_number < This.reac.rod_number'Old;

   function calculateWeight (This : in Train) return Weight with
     Pre => This.reac.OnOff = Off and This.wei >= Weight'First and This.wei <= Weight'Last,
     Post => calculateWeight'Result >= ReactorWeight and calculateWeight'Result <= Weight'Last;

   function calcTemp (This : in Train) return Temperature with
     Pre => This.reac.temp >= Temperature'First and this.reac.temp <= Temperature'Last,
     Post => calcTemp'Result >= Temperature'First and calcTemp'Result <= Temperature'Last;

   procedure balanceWaterReactor (This : in out Train)  with
     Pre => This.reac.OnOff = On and This.waTank.water_level  >= WaterLevel'First and This.waTank.water_level <= WaterLevel'Last,
     Post => This.waTank.water_level >= WaterLevel'First and This.waTank.water_level <= WaterLevel'Last;

   procedure overHeat (This : in out Train)  with
     Pre => This.reac.OnOff = On and This.reac.temp >= OverheatThreshold,
     Post => This.reac.OnOff = Off and this.reac.rod_number = reactor.Rods'Last and this.reac.status = Overheated;

   procedure trainToMaintenance (This : in out Train)  with
     Pre => This.reac.OnOff = On,
     Post => This.reac.status = Maintenance;

end Train;
