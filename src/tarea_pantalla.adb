with Ada.Text_Io, Ada.Integer_Text_Io, Ada.Float_Text_Io, Ada.exceptions;
use Ada.Text_Io, Ada.Integer_Text_Io, Ada.Float_Text_Io;

with Interfaz, Ada.Calendar, Tipos;
use Interfaz, Ada.Calendar, tipos;

with Ada.Numerics.Float_Random, Ada.Numerics.Discrete_Random;

package body Tarea_Pantalla is
   package Fix_IO is new Ada.Text_IO.Fixed_IO(DAY_DURATION);
   use Fix_Io;

   task body Pantalla is
      Anyo, Mes, dia   : Integer;
      Segundo          : Day_Duration;
      Id               : Integer;
      Aux              : Float;
      Cola             : ColaE.cola;

   begin
      loop
         select
            when Barrera =>
               accept Imprimir_Medicion(Valor : Float; Id : Integer; Time_And_Date: Time) do
                  delay 0.2;  --El dispositivo introduce un retraso de 0.2 segundos.
                  Put(Id); Put(": ");
                  Put(Item =>Valor, Aft => 1, Exp=>0);
                  Put("ºC");
                  Split(Time_And_Date, anyo, mes, dia, segundo);
                  Put(segundo, 8, 3, 0);
                  New_Line; New_Line;
               end Imprimir_Medicion;
         or
            accept Imprimir_Registro(Reg : registro) do
               Put("Numero de sensor: ");
               Get(Id);
               Cola := Reg(Id);
               while not ColaE.EsVacia(cola) loop
                  Put(Item => ColaE.Leer(cola), Aft => 1, Exp => 0); New_Line;
                  ColaE.Extraer(cola, Aux);
               end loop;
               New_Line;

            exception
               when Error:others =>
                  Put("Ocurrio un error al leer el registro. Puede ser que no haya datos");
                  New_Line;
                  Put(Ada.Exceptions.Exception_Information(Error));
            end Imprimir_Registro;

         or
            accept Menu(Mp : in Mprocedure; M : Mstring; Opcion : out integer) do
               --Borrar_Pantalla;
               delay 0.2;
               Mostrar_Menu(M);
               Get(Opcion);
               Barrera := false; --levantar barrera en cada funcion del menu
             end Menu;
         else
            null;
            --hacefalta un else para que cuando evalua la guarda a false no falle
         end select;
      end loop;

   end Pantalla;


   procedure Mostrar_Menu(M : In Interfaz.Mstring) is
   begin
      Interfaz.Imprimir_Menu(M);
   end Mostrar_Menu;

end Tarea_Pantalla;
