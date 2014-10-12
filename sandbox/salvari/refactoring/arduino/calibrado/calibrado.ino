/*----------------------------------------------------------------------
  Programa diseñado para el taller de SODAR: Arduino + Processing
  OSHWDem-2014

  calibrado.ino

  Un programa para calibrar el servo

  Fija el servo a 90 grados 
 ----------------------------------------------------------------------*/

#include <Servo.h>

#define SERVO_PWM_PIN 9      // El servo lo conectamos al pin 9 del arduino (PWM)
Servo myservo;               // Declaramos una variable de tipo servo

/*----------------------------------------------------------------------
  setup
   Se ejecuta una sola vez al principio del programa. O cuando el arduino
   se resetea.
 ----------------------------------------------------------------------*/
void setup() {
  Serial.begin(9600);                // Abrimos el puerto serie (de momento para depurar)
  myservo.attach(SERVO_PWM_PIN);     // Asociamos el objeto servo a un pin de control
}

/*----------------------------------------------------------------------
  loop
   Se ejecuta siempre, hasta el fin de los tiempos :-)
 ----------------------------------------------------------------------*/
void loop() {
  delay(50);                       // Esperamos para que el servo acabe su último movimiento 
  myservo.write(90);               // Pasamos el nuevo ángulo al servo
}
 
