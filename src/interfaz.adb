with Ada.Integer_Text_Io, Ada.Text_IO, ada.exceptions;
use Ada.Integer_Text_Io, Ada.Text_Io;

package body Interfaz is


   procedure Imprimir_Menu(M : in Mstring) is
   begin
      for I in 1..M'Last loop
         Put(I, Width =>1);
         Put(". ");
         Put(M(I).all);
         New_Line;
      end loop;

   end Imprimir_Menu;

   procedure procedimientos(M : in mprocedure; opcion : integer) is
      Valor_Puntero : Pprocedure;
   begin
      Valor_Puntero := M(opcion);
      Valor_Puntero.all;
    exception
      when Constraint_Error =>
         Put("Seleccion incorrecta.");
         New_Line;New_Line;
      when Error:others =>
         put(ada.Exceptions.Exception_Information(Error));
   end procedimientos;




end Interfaz;
