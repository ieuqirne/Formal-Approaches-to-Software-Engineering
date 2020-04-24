with reactor; use reactor;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body train with SPARK_Mode is

   procedure calculateSpeed (This : in out Train) is
      Pow : Float := Float(This.reac.pow);
      Wei : Float := Float(This.wei);
      --Total : Float;
      --TotalInt : Speed;
   begin
      --Total := Pow / Wei * 100.00;
      --Put_Line("Total: " & Total'Image);
      --Total := Total ;

      --This.sp := Speed(Total);
      This.sp := Speed(Pow / Wei * 100.00);
      --This.sp := TotalInt;
   end calculateSpeed;


   procedure Update (This : in out Train) is
   begin

      calculateSpeed(This);
   end update;

end train;
