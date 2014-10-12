/*----------------------------------------------------------------------
  Programa diseñado para el taller de SODAR: Arduino + Processing
  OSHWDem-2014

  SODAR_01/radar_a_solved.ino

  Una solución para el primer ejercicio del curso.

  Objetivo mover el servo
 ----------------------------------------------------------------------*/

#include <Servo.h>

#define SERVO_PWM_PIN 9      // El servo lo conectamos al pin 9 del arduino (PWM)
#define ANGLE_SAFE 10        // El ángulo de seguridad será de 10 grados
#define ANGLE_STEP 2         // El paso al inicio es de 2 grados


int min_angle = ANGLE_SAFE;          // Calculo el ángulo mínimo
int max_angle = 180 - ANGLE_SAFE;    // Calculo el ángulo máximo

int angle     = min_angle;           // Empezamos el barrido en el ángulo mínimo
int dir       = 1;                   // Empezamos aumentando el ángulo

Servo myservo;                       // Declaramos una variable de tipo servo

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
   Se ejecuta siempre repetidamente, hasta el fin de los tiempos :-)
 ----------------------------------------------------------------------*/
void loop() {
  delay(50);                          // Esperamos para que el servo acabe su último movimiento 
  myservo.write(angle);               // Pasamos el nuevo ángulo al servo
  angle += dir * ANGLE_STEP;          // Calculo el siguiente ángulo
  if (angle >= max_angle || angle <= min_angle) {  // Si el ángulo esta fuera de límites
    dir = -dir;                                    //  cambio la dirección
  }
    
}
 
