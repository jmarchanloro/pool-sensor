with Ada.Text_Io, Ada.Integer_Text_Io, Interfaz, Operaciones;
use Ada.Text_Io, Ada.Integer_Text_Io, Interfaz, Operaciones;

with Tarea_Operario, Proc_Aux_Interfaz, tipos;
use Tarea_Operario, Proc_Aux_Interfaz, tipos;

procedure PoolSensor is


   ------------------------MENU----------------------------
   --se crea el mensaje que mostrara el menu,
   --asi como los punteros a las funciones
   --que ejecutara el menu. Dichas funciones
   --se encuentra en proc_aux_interaz

   Ps1 : Pstring := new String'("Lanzar nuevo sensor");
   Ps2 : Pstring := new String'("Mostrar sensores activos");
   Ps3 : Pstring := new String'("Mostrar las ultimas tres mediciones");
   Ps4 : Pstring := new String'("Dar de baja a un sensor");
   Ps5 : Pstring := new String'("Medicion inmediata");

   M  : Mstring(1..5) := (Ps1, Ps2, Ps3, Ps4 ,Ps5);

   Pp1 : Pprocedure := Lanzar_Sensor'Access;
   Pp2 : Pprocedure := Sensores_Activos'Access;
   Pp3 : Pprocedure := Ultimas_Mediciones'Access;
   Pp4 : Pprocedure := Dar_De_Baja'Access;
   Pp5 : Pprocedure := Medicion_Inmediata'Access;

   Mp : Mprocedure(1..5) := (Pp1, Pp2, Pp3, Pp4, pp5);

   ----------------------------------

   C:Character;

begin
   Barrera := True;   --Se levanta la barrera para permitir
                      --imprimir por pantalla
   for I in 1..3 loop
      Control.Lanzar_Sensor;
   end loop;

   loop
      Get_immediate(C);
      Operario.Ver_menu(Mp, M);
   end loop;
end PoolSensor;
