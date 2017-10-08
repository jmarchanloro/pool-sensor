package Interfaz is

   type Pstring is access String;
   type Mstring is array(Integer range <>) of Pstring;

   type pprocedure is access procedure;
   type mprocedure is array(integer range <>) of pprocedure;

   procedure Imprimir_Menu(M : in Mstring);
   procedure procedimientos(M : in mprocedure; opcion : integer);






end Interfaz;



