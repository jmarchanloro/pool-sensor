--| 15/03/2012
--| IMPLEMENTACIÓN DE LA COLA ESTÁTICA
 
-- Funciones del paquete:
package body cola_estatica is
 
  --| INICIALIZA UNA COLA:
  --| Precondición: Se ha de recibir un parámetro de tipo Cola (registro con elemento:vector; numNodos,primero,ultimo:integer)
  --| Poscondición: Se inicializa a 0 el contador de Nodos de la Cola.
  procedure inicializar( c:in out cola ) is
  begin
    c.numNodos := 0;
  end inicializar;
 
  --| INDICA SI LA COLA ESTA VACÍA:
  --| Precondición: Se ha de recibir un parámetro de tipo Cola.
  --| Poscondición: Se devuelve un true si la cola esta vacía o un false en caso contrario.
  function esVacia( c:in cola ) return boolean is
  begin
    if c.numNodos > 0 then
      return false;
    else
      return true;
    end if;
  end esVacia;
 
  --| INDICA SI LA COLA ESTA LLENA:
  --| Precondición: Se ha de recibir un parámetro de tipo Cola.
  --| Poscondición: Se devuelve un true si la cola esta llena o un false en caso contrario.
  function esLlena( c:in cola ) return boolean is
  begin
    if c.numNodos < max then
      return false;
    else
      return true;
    end if;
  end esLlena;
 
  --| INSERTA UN NUEVO NODO AL FINAL DE LA COLA:
  --| Precondición: Se ha de recibir un parámetro de tipo Cola y el tipo de dato a guardar en los Nodos de la Cola. Se ha de comprobar que haya espacio con la función esLlena().
  --| Poscondición: Se insertan los datos en el último Nodo de la Cola.
  procedure insertar( c:in out cola; d:in datos ) is
  begin
    if c.numNodos = 0 then
      c.numNodos            := 1;
      c.primero             := 1;
      c.ultimo              := 1;
      c.elemento(c.primero) := d;
 
    else
      c.numNodos := c.numNodos + 1;
 
      if c.ultimo = 1 then
        c.ultimo := max;
      else
        c.ultimo := c.ultimo - 1;
      end if;
 
      c.elemento(c.ultimo) := d;
    end if;
  end insertar;
 
  --| LEE LOS DATOS DEL PRIMER NODO:
  --| Precondición: Se ha de recibir un parámetro de tipo Cola. Se ha de comprobar que no este vacía con la funcion esVacia()
  --| Poscondición: Se devuelven los datos del primer Nodo de la Cola.
  function leer( c:in cola ) return datos is
  begin
    return c.elemento(c.primero);
  end leer;
 
  --| EXTRAE LOS DATOS DEL PRIMER NODO:
  --| Precondición: Se ha de recibir un parámetro de tipo Cola y el tipo de dato a guardar en los Nodos de la Cola. Se ha de comprobar que no este vacía con la función esVacia()
  --| Poscondición: Devuelve por referencia los datos del primer Nodo y a continuacion lo elimina.
  procedure extraer( c:in out cola; d:out datos ) is
  begin
    d := c.elemento(c.primero);
 
    if c.numNodos > 1 then
      if c.primero = 1 then
        c.primero := max;
      else
        c.primero := c.primero - 1;
      end if;
    end if;
 
    c.numNodos := c.numNodos - 1;
  end extraer;
 
end cola_estatica;
