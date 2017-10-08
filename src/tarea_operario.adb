with Tarea_Pantalla, Interfaz;
use Tarea_Pantalla, Interfaz;

package body Tarea_Operario is

   task body Operario is
      Opcion : Integer;
   begin
      loop
         accept Ver_Menu(Mp : Mprocedure; M: Mstring)  do
            Pantalla.Menu(Mp, M, opcion);
            --Operario toma el control del proceso
            --pantalla para imprimir el menu.
            Procedimientos(Mp, Opcion);
            --Ejecuta el procedimiento correspondiente.
            --Si ese procedimiento necesita informacion
            --baja la barrera para que nadie tome el
            --control del proceso pantalla mientras el
            --usuario introduce los datos, pero esta
            --no se queda bloqueada por ninguna tarea
         end Ver_Menu;
      end loop;
   end Operario;


end Tarea_Operario;
