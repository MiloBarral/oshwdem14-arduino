/*----------------------------------------------------------------------
  Programa diseñado para el taller de SODAR: Arduino + Processing
  OSHWDem-2014

  SODAR_02/sensor_ultra/sensor_ultra.ino

  Calcular distancias con el sensor de ultrasonidos. Esqueleto básico
 ----------------------------------------------------------------------*/

#define ECHO_PIN    7 // El pin "echo" de sensor estará en el pin 7 del arduino
#define TRIGGER_PIN 8 // El pin "trigger" del sensor estará en el pin 8 del arduino



/*----------------------------------------------------------------------
  setup
   Se ejecuta una sola vez al principio del programa. O cuando el arduino
   se resetea.
 ----------------------------------------------------------------------*/
void setup() {
  Serial.begin(9600);        // Abrimos el puerto serie

  pinMode(TRIGGER_PIN, OUTPUT);  // pin trigger es salida
  pinMode(ECHO_PIN   , INPUT );  // pin echo es entrada
}


/*----------------------------------------------------------------------
  loop
   Se ejecuta siempre repetidamente, hasta el fin de los tiempos :-)
 ----------------------------------------------------------------------*/
void loop() {


}
