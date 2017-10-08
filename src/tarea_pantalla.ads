with Interfaz, Ada.Calendar, tipos;
use Interfaz, Ada.Calendar, tipos;

package Tarea_Pantalla is

task Pantalla is
      entry Menu(Mp: Mprocedure; M : Mstring; Opcion: out integer);
      entry Imprimir_Medicion(Valor : Float; Id : Integer; Time_And_Date: Time);
      entry Imprimir_Registro(Reg : registro);
end Pantalla;

procedure Mostrar_Menu(M : in Interfaz.Mstring);

end Tarea_Pantalla;
