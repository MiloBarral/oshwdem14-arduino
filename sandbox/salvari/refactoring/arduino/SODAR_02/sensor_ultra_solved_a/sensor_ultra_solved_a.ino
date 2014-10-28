/*----------------------------------------------------------------------
  Programa diseñado para el taller de SODAR: Arduino + Processing
  OSHWDem-2014

  sensor_ultra_a_solved.ino


 ----------------------------------------------------------------------*/

#define ECHO_PIN    7 // El pin "echo" de sensor estará en el pin 7 del arduino
#define TRIGGER_PIN 8 // El pin "trigger" del sensor estará en el pin 8 del arduino


float dist;

/*----------------------------------------------------------------------
  setup
   Se ejecuta una sola vez al principio del programa. O cuando el arduino
   se resetea.
 ----------------------------------------------------------------------*/
void setup() {
  pinMode(TRIGGER_PIN, OUTPUT);  // pin trigger es salida
  pinMode(ECHO_PIN   , INPUT );  // pin echo es entrada
  
  Serial.begin(9600);            // Abrimos el puerto serie
}


/*----------------------------------------------------------------------
  loop
   Se ejecuta siempre repetidamente, hasta el fin de los tiempos :-)
 ----------------------------------------------------------------------*/
void loop() {

  Serial.println(medida());

}

float medida(){

  float result = 0;
  float time;
 
  
  for (int i=0; i<5; i++){
                                          // Preparamos el sensor
    digitalWrite(TRIGGER_PIN, LOW);       //   Nivel bajo para estabilizar
    delayMicroseconds(5);                 //   garantizamos 5 microsegundos
  
    digitalWrite(TRIGGER_PIN, HIGH);      // Enviamos un pulso de 10 microsegundos
    delayMicroseconds(10);
    digitalWrite(TRIGGER_PIN, LOW);
  
                                        // Leemos el echo, viene codificado en 
    time = pulseIn(ECHO_PIN, HIGH);     // el ancho del pulso
  
    
  
    result += (time / 29 / 2);          // Acumulamos la distancia
  

  
    delay(60);
    
  }

  result = result / 5;                 // Calculamos la media
  
  if (result > 400) {                  // Distancia mayor que alcance
    //return 400;
    return 0;
  } else {
    return result;
  }
                                        
}
