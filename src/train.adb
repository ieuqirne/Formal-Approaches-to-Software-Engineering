with reactor; use reactor;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body train with SPARK_Mode is

   procedure calculateSpeed (This : in out Train) is
      Pow : Float := Float(This.reac.pow);
      Wei : Float := Float(This.wei);
      SpFloat : Float;
      --Total : Float;
      --TotalInt : Speed;
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
      if(This.reac.OnOff = Off) then
         SpFloat := 0.0;
      else
         SpFloat := Pow / Wei * 100.0;
      end if;

      if(SpFloat > 100.00) then
        This.Sp := 100;
      else
         This.sp := Speed(SpFloat);
      end if;

      --Put_Line ("SpFloat: " & SpFloat'Image);
      --Put_Line ("This.sp: " & This.sp'Image);
      --This.sp := TotalInt;
   end calculateSpeed;

   procedure addCarriage (This : in out Train) is
   begin
      if This.reac.OnOff = Off and  This.numbCarri < Carriage'Last then
         This.numbCarri := This.numbCarri + 1;
         --calculateWeight(This);
      end if;

   end addCarriage;



   procedure calculateWeight (This : in out Train) is
      --CW : Integer := CarriageWeight;
      CN : Carriage := This.numbCarri;
      --Caaa : Integer :=  Integer(this.numbCarri) * CarriageWeight;
      Caaaaa : Integer ;
   begin
      --Put_Line("CarriageWeight: " & CW'Image);
      Put_Line("This.numbCarri: " & CN'Image);


      --Put_Line("Caaa: " & Caaa'Image);
      --Put_Line("Caaaaa: " & Caaaaa'Image);
      Put_Line("ReactorWeight: " & ReactorWeight'Image);
      Caaaaa :=  Integer(this.numbCarri);
      Put_Line("Caaaaa: " & Caaaaa'Image);

      This.wei := ReactorWeight + Weight(Integer(CarriageWeight) * Integer(this.numbCarri));

   end calculateWeight;


--     procedure Update (This : in out Train) is
--     begin
--        calculateSpeed(This);
--     end update;

end train;
