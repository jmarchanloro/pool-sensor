# pool-sensor
Pool sensor to collect temperature data.

Directories struct:
/src    Source files .adb, .ads
/elb    Files .o, .ali (created automatically through make)
/exec   Executable files (created automatically through make)

How to compile and execute:
>make
>./exec/pool-sensor


The system fulfill the following specifications:

Temperature sensor:
  - Each sensor will collect periodic measures each 5 s. 
  - Accuracy: 0.1ºC 
  - Value [-5, 30] ºC
  
Control process:
  - Launch control processes of the sensors.
  - Register measures from the sensor.
  - Attend to operator request

Screen process:
  - Print screen messages
  - Two task can not take control of the screen at the same time
  
Operator:
  - Launch a new sensor process
  - Show a list of active sensors
  - Request the last three measures
  - Shutdown a sensor
  - Request a new measure
  
  

