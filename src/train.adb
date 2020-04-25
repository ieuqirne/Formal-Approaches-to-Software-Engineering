with reactor; use reactor;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body train with SPARK_Mode is

   function calculateSpeed (This : in Train) return Speed is
      --Pow : Float := Float(This.reac.pow);
      --Wei : Float := Float(This.wei);
      SpFloat : Float;
      --Total : Float;
      --TotalInt : Speed;
      Spee : Speed;
   begin
      --Total := Pow / Wei * 100.00;
      --Put_Line("Total: " & Total'Image);
      --Total := Total ;

      --This.sp := Speed(Total);
      --Pow := 1.00;
      --Wei := 1.00;
      --Put_Line ("Hey: ");
      --Put_Line ("Pow: " & Pow'Image);
      --Put_Line ("Wei: "& Wei'Image);
      --Sp := Pow / Wei;
      if(This.reac.pow = 0) then
         SpFloat := 0.0;
      else
         SpFloat := Float(This.reac.pow) / Float(This.wei) * 100.0;
      end if;

      if(SpFloat > 100.00) then
        Spee := 100;
      elsif (SpFloat = 0.0) then
           Spee := 0;
      else
        Spee := Speed(SpFloat);
      end if;

      return Spee;

      --Put_Line ("SpFloat: " & SpFloat'Image);
      --Put_Line ("This.sp: " & This.sp'Image);
      --This.sp := TotalInt;
   end calculateSpeed;

   procedure addCarriage (This : in out Train) is
   begin
      if This.reac.OnOff = Off and  This.numbCarri < Carriage'Last then
         This.numbCarri := This.numbCarri + 1;
         This.wei := calculateWeight(This);
         --This.wcalculateWeight(This);
      end if;

   end addCarriage;

   procedure decreaseCarriage (This : in out Train) is
   begin
      if This.reac.OnOff = Off and  This.numbCarri > Carriage'First then
         This.numbCarri := This.numbCarri - 1;
         This.wei := calculateWeight(This);
         --This.wcalculateWeight(This);
      end if;

   end decreaseCarriage;

   procedure addRod (This : in out Train) is
   begin
      if This.reac.OnOff = On and  This.reac.rod_number < Rods'Last then
         This.reac.rod_number := This.reac.rod_number + 1;
         This.reac.pow := calculatePower(This.reac);
         This.sp := calculateSpeed(This);
         --calculateSpeed(This);
      end if;

   end addRod;

   procedure decreaseRod (This : in out Train) is
   begin
      if This.reac.OnOff = On and  This.reac.rod_number > Rods'First then
         This.reac.rod_number := This.reac.rod_number - 1;
         This.reac.pow := calculatePower(This.reac);
         This.sp := calculateSpeed(This);
      end if;

   end decreaseRod;


   function calculateWeight (This : in Train) return Weight
   is
      --CW : Integer := CarriageWeight;
      -- CN : Carriage := This.numbCarri;
      --Caaa : Integer :=  Integer(this.numbCarri) * CarriageWeight;
      --Caaaaa : Integer ;
      ret : Weight;
   begin
      --Put_Line("CarriageWeight: " & CW'Image);
     -- Put_Line("This.numbCarri: " & CN'Image);
      --Put_Line("Caaa: " & Caaa'Image);
      --Put_Line("Caaaaa: " & Caaaaa'Image);
      --Put_Line("ReactorWeight: " & ReactorWeight'Image);
      --Caaaaa :=  Integer(this.numbCarri);
      --Put_Line("Caaaaa: " & Caaaaa'Image);
      if(This.numbCarri = 0) then
         ret := ReactorWeight;
      else
         ret :=  ReactorWeight + Weight(Integer(CarriageWeight) * Integer(this.numbCarri));
      end if;

      return ret;
   end calculateWeight;


--     procedure Update (This : in out Train) is
--     begin
--        calculateSpeed(This);
--     end update;

end train;
