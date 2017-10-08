with Cola_Estatica;

package Tipos is

   package colaE is new cola_estatica(3, Float);
   type registro is array(1..10) of colaE.cola;

   barrera : boolean;  --variablee global. Cuando
                       --el operario ejecuta una
                       --accion y el sistema necesite
                       --conocer algun dato(nºsensor)
                       --se baja la barrera para
                       --que nadie interrumpa
                       --Al acabar. cada accion debe
                       --asegursarse de levantarla


end Tipos;
