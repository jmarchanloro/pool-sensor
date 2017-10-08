--| 15/03/2012
--| ESPECIFICACIÓN DE LA COLA ESTÁTICA
 
--| PRECONDICIÓN:
--| Se ha de recibir de la instanciacion de la librería, un parámetro de tipo natural y el tipo de datos a almacenar en cada Nodo de la Cola.
--| Se ha de controlar que la pila no este vacía/llena con las funciones esVacia/esLlena antes de usar insertar/leer/extraer.
 
generic
 
  -- Parámetros recibidos de la instanciacion de la librería: (private - limited private)
  max:natural;
  type datos is private;
 
package cola_estatica is
 
  -- Se definen las cabeceras (como private - limited private) de los tipos de datos que emplearan las funciones, se terminan de definir en la zona private:
  type cola is private; --limited private;--  JAVIER MARCHAN LORO: MODIFICO LIMITED PRIVATE PARA ADAPTARLO A LA PRACTICA.
 
  -- Se definen las cabeceras de las funciones contenidas en el fichero de implementación:
  procedure inicializar( c:in out cola              );
  function      esVacia( c:in     cola              ) return boolean;
  function      esLlena( c:in     cola              ) return boolean;
  procedure    insertar( c:in out cola; d:in datos  );
  function         leer( c:in     cola              ) return datos;
  procedure     extraer( c:in out cola; d:out datos );
 
  -- Desde la zona privada, se detalla como son las variables declaradas previamente como privadas:
  private
 
    type vector is array(1..max) of datos;
 
    type cola is record
      elemento:vector;
      numNodos:integer;
      primero:integer;
      ultimo:integer;
    end record;
 
end cola_estatica;
