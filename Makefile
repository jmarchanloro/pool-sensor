CC = gcc
BIND = gnatbind
LINK = gnatlink
CFLAGS = -c 

OBJ  = obj
SRC  = src
EXEC = exec
ELB  = elb
MAIN = practica2

RM = rm -f


all: $(EXEC)/$(MAIN) 


$(ELB)/interfaz.ali : $(SRC)/interfaz.ads $(SRC)/interfaz.adb
	$(CC) $(CFLAGS) $(SRC)/interfaz.adb
	mv ./interfaz.ali ./interfaz.o ./$(ELB)

$(ELB)/operaciones.ali : $(SRC)/operaciones.ads $(SRC)/operaciones.adb
	$(CC) $(CFLAGS) $(SRC)/operaciones.adb
	mv ./operaciones.ali ./operaciones.o ./$(ELB)

$(ELB)/proc_aux_interfaz.ali : $(SRC)/proc_aux_interfaz.ads $(SRC)/proc_aux_interfaz.adb
	$(CC) $(CFLAGS) $(SRC)/proc_aux_interfaz.adb
	mv ./proc_aux_interfaz.ali ./proc_aux_interfaz.o ./$(ELB)

$(ELB)/tarea_operario.ali : $(SRC)/tarea_operario.ads $(SRC)/tarea_operario.adb
	$(CC) $(CFLAGS) $(SRC)/tarea_operario.adb
	mv ./tarea_operario.ali ./tarea_operario.o ./$(ELB)

$(ELB)/globalcte.ali : $(SRC)/globalcte.ads
	$(CC) $(CFLAGS) $(SRC)/globalcte.ads
	mv ./globalcte.ali ./globalcte.o ./$(ELB)

$(ELB)/cola_estatica.ali : $(SRC)/cola_estatica.ads $(SRC)/cola_estatica.adb
	$(CC) $(CFLAGS) $(SRC)/cola_estatica.adb
	mv ./cola_estatica.ali ./cola_estatica.o ./$(ELB)


$(ELB)/tarea_pantalla.ali : $(SRC)/tarea_pantalla.ads $(SRC)/tarea_pantalla.adb
	$(CC) $(CFLAGS) $(SRC)/tarea_pantalla.adb
	mv ./tarea_pantalla.ali ./tarea_pantalla.o ./$(ELB)


$(ELB)/$(MAIN).ali : $(SRC)/$(MAIN).adb
	$(CC) $(CFLAGS) $^
	mv ./$(MAIN).ali ./$(MAIN).o ./$(ELB)


$(EXEC)/$(MAIN) : $(ELB)/$(MAIN).ali $(ELB)/interfaz.ali  $(ELB)/operaciones.ali  $(ELB)/proc_aux_interfaz.ali  $(ELB)/tarea_operario.ali  $(ELB)/globalcte.ali  $(ELB)/cola_estatica.ali  $(ELB)/tarea_pantalla.ali
	$(BIND) $^
	$(LINK) $(ELB)/$(MAIN).ali
	mv $(MAIN) $@

clean:
	$(RM) ./*~ $(SRC)/*~ $(OBJ)/* $(EXEC)/* $(ELB)/*
