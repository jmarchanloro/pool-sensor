with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_Io, Ada.Integer_Text_IO;

with Operaciones, tipos;
use Operaciones, tipos;

--------------------------------------------------------------------
--Cuando alguno de estos procedimientos son llamados, se ha bajado
--la barrera para que ninguna impresion de una medicion  interrumpa
--a la tarea pantalla, de este modo nadie la utiliza pero no se queda
--bloqueada por ninguna tarea. Antes de terminar, se debe volver a
--levantarla (barrera := true)
---------------------------------------------------------------------

package body Proc_Aux_Interfaz is
     procedure lanzar_sensor is
   begin
      control.Lanzar_Sensor;
      Put("Sensor lanzado");New_Line;
      Barrera := True;
   end Lanzar_Sensor;



   procedure dar_de_baja is
      Nsensor : Integer;
   begin
      Put("¿Que sensor quiere dar de baja?(Indique un nº del 1-10: ");
      Get(Nsensor);
      control.abortar(Nsensor);
      Barrera := True;

      --No hace falta capturar ninguna excepcion.
      --SI se selecciona un sensor que no existe
      --lo controla el procedimiento
      --Abortar (Id: Integer; Red_Sensores: in out Msensores;
             --Reg : in out Registro)
   end dar_de_baja;



   procedure Medicion_Inmediata is
      Id       : Integer;
   begin
      Put("Numero Sensor: ");
      Get(Id);
      Barrera := True;
      Red_Sensores(Id).Medicion_Explicita;

   end medicion_inmediata;



   procedure Sensores_Activos is
      Aux : Integer := 1;
   begin
      for I in 1..10 loop
         Put("Sensor "); Put(I, 2);
         if Red_Sensores(I) /= null then
            Put(" ACTIVADO"); New_Line;
         else
            Put(" DESACTIVADO"); New_Line;
         end if;
      end loop;
      New_Line;
      Barrera := True;

   end Sensores_Activos;



   procedure Ultimas_Mediciones is
   begin
      Control.Ultimas_Mediciones;
      Barrera := True;

   end Ultimas_Mediciones;

end Proc_Aux_Interfaz;
