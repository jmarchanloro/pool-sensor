with interfaz, ada.calendar, Cola_Estatica, tipos;
use interfaz, ada.Calendar, tipos;

package operaciones is

   --Tarea sensor. Al crear una instancia de sensor
   --se le pasa un id que genera control de forma
   --secuencial para identificar al sensor.
   task type Sensor(Id : Integer) is
      entry Medicion_Explicita;
   end Sensor;


   task Control is
      entry Registrar(Id: Integer; Valor: Float);
      --Registrar :  registra una medicion de un sensor
      --Argumentos:  id    => identificador del sensor
      --             valor => medicion que se registra

      entry Ultimas_Mediciones;
      --Ultimas_mediciones : muestra las ultimas mediciones
      --de un determinado sensor

      entry Lanzar_Sensor;
      --Lanza una nueva tarea sensor.

      entry Medicion_Explicita(Id : Integer);
      --Medicion_explicita : pide una medicion a un sensor
      --Argumentos         : id => sensor al que le pide la medicon

      entry Abortar(Id : Integer);
      --Abortar    : Acaba con una tarea sensor
      --Argumentos : id => sensor que se quiere abortar.
   end Control;


   type Puntero_Sensor is access Sensor;
   type Msensores is array(1..10) of Puntero_Sensor;

   Red_Sensores : Msensores;     --variable global que almecenara
                                 --los sensores activos del sistema



   ----------------------------------------------------------
   --ESPECIFICACION DE FUNCIONES Y PROCEDIMIENTOS EN LAS QUE
   --LA TAREA CONTROL SE APOYA PARA REALIZAR SU FUNCION.
   ----------------------------------------------------------

   function Medicion(Ultima : in Float) return Float;
   --Medicion   : genera un valor aleatorio float simulando una medicion
   --Argumentos : ultima => valor de la ultima medicion de un sensor
   --Retorno    : float generado aleatoriamente

   procedure Registrar(C : in out ColaE.cola; Valor: Float);
   --Registrar  : registra una medicion en la cola del sensor correspondiente
   --Argumentos : C     => cola del sensor
   --             valor => valor que se registra

   procedure Abortar(Id: Integer; Red_Sensores: in out Msensores; Reg : in out registro);
   --Abortar: Acaba con una tarea sensor
   --Argumentos: id           => sensor que se quiere abortar
   --            red_sensores => matriz con punteros a los sensores activos
   --            reg          => registro de las mediciones (ver tipo en registro en tipos.ads)



end operaciones;
