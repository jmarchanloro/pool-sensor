package Proc_Aux_Interfaz is

   ---------------------------------------------------------------------
   --PROCEDIMIENTOS AUXILIARES NECESARIOS PARA CREAR LOS PUNTEROS QUE
   --SE UTILIZARAN EN LA INTERFAZ. ESTOS PROCEDIMIENTOS HACEN DE PUENTE
   --ENTRE LA INTERFAZ Y LA TAREA CONTROL (DEBIDO A QUE NO SE PUEDE
   --CREAR UN PUNTERO A UN PUNTO DE ENTRADA)
   ---------------------------------------------------------------------

   procedure Lanzar_Sensor;
   --Lanzar_sensor: Lanza una tarea sensor;

   procedure Dar_De_Baja;
   --Dar_de_baja : Abortar una tarea sensor

   procedure Medicion_Inmediata;
   --medicion_inmediata : pide una medicion a un determinado sensor

   procedure Sensores_Activos;
   --sensores_activos: muestra los sensores activos en ese instante

   procedure Ultimas_Mediciones;
   --Ultimas_mediciones : muestra las ultimas mediciones de un
   --determinado sensor

end Proc_Aux_Interfaz;
