with Ada.Text_IO, Ada.Integer_Text_IO,  Ada.Float_Text_Io, Interfaz, Cola_Estatica, Ada.Numerics.Float_Random,
  Ada.Numerics.Discrete_Random, Ada.exceptions;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_Io, interfaz;

with Ada.Calendar, Tipos, Tarea_pantalla;
use Ada.Calendar, Tipos, Tarea_pantalla;


package body operaciones is
   package Fix_IO is new Ada.Text_IO.Fixed_IO(DAY_DURATION);
   use Fix_IO;

   Time_And_Date  : TIME;

   --------------------------------------------------------------------

task body Sensor is
   Valor  : Float;        --Valor obtenido de la medicion
   Ultima : Float := 0.0; --Valor de la ultima medicion
   begin
      loop
         select
            accept Medicion_Explicita do
               Time_And_Date := Clock;
               Valor         := Medicion(Ultima);
               Ultima        := Valor;
               Control.Registrar(Id, valor);
               Pantalla.Imprimir_Medicion(Valor, Id, Time_And_Date);
            end;
         or
            delay(5.0);   --Cada 5 segundos medimos
            Time_And_Date := Clock;
            Valor         := Medicion(Ultima);
            Ultima        := Valor;
            Control.Registrar(Id, valor);
            Pantalla.Imprimir_Medicion(Valor, Id, Time_And_Date);
         end select;
      end loop;
   end Sensor;



   task body Control is
      reg : registro;   --reg guarda el registro de las tres
                        --ultimas mediciones de los sensores

      I : Integer := 0; --indica el nuermo del siguinete sensor
                        --para lanzar

   begin
      loop
         select
            accept Registrar(Id: Integer; Valor: Float) do
               Registrar(Reg(Id), Valor);
            end Registrar;
         or
            accept Ultimas_Mediciones do
                Pantalla.Imprimir_Registro(Reg);
            end Ultimas_Mediciones;
         or
            accept Lanzar_Sensor do
               I := I+1;
               Red_Sensores(I) := new Sensor(I); --Se lanza un nuevo sensor

               colaE.inicializar(reg(I));        --se inicializa  la cola
                                                 --asociada al nuevo sensor
                                                 --(la cola almacena las 3
                                                 --ultimas mediciones)
            exception
               when Error:others =>
                  if I > 10 then
                     Put("No se pueden lanzar mas sensores");
                     New_Line;
                  else
                     Put(Ada.Exceptions.Exception_Information(Error));
                     New_Line;
                  end if;

            end Lanzar_Sensor;
         or
            accept Medicion_Explicita(Id : Integer) do
               Red_Sensores(Id).Medicion_Explicita;

               exception
               when Constraint_Error =>
                  Put("Numero de sensor no valido");
                  New_Line;

            end Medicion_Explicita;
         or
            accept Abortar(Id: Integer) do
               Abortar(Id, Red_Sensores, Reg);
            end Abortar;

         end select;
      end loop;
   end Control;



   ----------------------------------------------------------------------------
   -----------------------------OPERACIONES------------------------------------
   ----------------------------------------------------------------------------

   function Medicion(Ultima : in Float) return Float is

      type miInteger is range -5..29;  --Entero para generar la parte entera
      type miDecimal is range  0..10;  --Entero para generar la parte decimal
      type MiRango   is range -4..4;   --Para la restricion de 5ºC de diferencia
                                       --entre dos medidas consecutivas.

      Numero    : Float;               --Resultado
      pEntera   : miInteger;           --Parte entera restringida a [-5, 29]
      pDecimal  : miDecimal;           --Parte decimal al dividr entre diez
                                       --[0.0, 0.1, ..., 0.9,1]
      P_E_Res   : MiRango;             --Parte entera restringida a [-4,4]

      --Se crean tres instancias del paquete generico con los tipos creados
      package pEnte is new ada.numerics.discrete_random(miInteger);
      package PDeci is new Ada.Numerics.Discrete_Random(MiDecimal);
      package PRang is new Ada.Numerics.Discrete_Random(MiRango);

      Generador_1 : pEnte.Generator;
      Generador_2 : PDeci.Generator;
      Generador_3 : PRang.Generator;

   begin
      if (Ultima = 0.0) then
         --Si es la primera medida del sensor, se genera un
         --numero completamente (pseud)aleatorio
         PEnte.Reset(Generador_1);
         PDeci.Reset(Generador_2);
         PEntera  := pEnte.Random(Generador_1);
         PDecimal := pDeci.Random(Generador_2);

         Numero   := Float(PEntera) + ((Float(PDecimal))/10.0);
      else
         --Si no es la primera, utilizamos la ultima medida
         --para generar un valor +/- 5ºC
         PRang.Reset(Generador_3);
         PDeci.Reset(Generador_2);
         P_E_res  := PRang.Random(Generador_3); --Entero entre [-4,4]
         PDecimal := PDeci.Random(Generador_2);

         Numero := Ultima + Float(P_E_res) + ((Float(PDecimal))/10.0);

         --Nos aseguramos que el numero no sobrepasa los limites [-5, 30]
         --Por ejemplo, si la ultima medida fue 29.5 y se ha generado un
         --aumento de 4.2 se sobrepasaria el limite de 30ªc
         if Numero < -5.0 then
            Numero := -5.0;
         else
            if Numero > 30.0 then
               Numero := 30.0;
            end if;
         end if;

      end if;

      return Numero;
   end Medicion;



   procedure Registrar(C : in out ColaE.cola; Valor: Float) is
        aux : float; --Variable auxiliar. Al extraer, la funcion del paquete
                     --cola_estatica devuelve por referencia el dato que elimina
   begin
        if (colaE.esLlena(C)) then
                ColaE.extraer(C, Aux);
                ColaE.insertar(C, Valor);
        else
                ColaE.insertar(C, Valor);
        end if;

   end Registrar;


   procedure Abortar(Id: Integer; Red_Sensores: in out Msensores; Reg : in out Registro) is
      Indice : Integer := Id;
   begin
      abort Red_Sensores(Id).all;
      Red_Sensores(Id) := null;
      ColaE.Inicializar(Reg(Id));

   exception
      when Constraint_Error =>
         Put("Error. Puede que ese sensor NO este activo");
         New_Line;
   end Abortar;

end operaciones;
