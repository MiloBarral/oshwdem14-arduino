const int trigger = 5;
const int echo    = 4;
const int buzz    = 10;

float dist, time;
  
void setup() {
  // put your setup code here, to run once:
  pinMode(trigger, OUTPUT);  // pin trigger es salida
  pinMode(echo   , INPUT );  // pin echo es entrada
  
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  
  // Preparamos el sensor
  digitalWrite(trigger, LOW);
  delayMicroseconds(5);
  
  // Enviamos un pulso de 10 microsegundos
  digitalWrite(trigger, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigger, LOW);
  
  // Leemos el echo
  time = pulseIn(echo, HIGH);
  
  
  
  dist = time / 29 /2;
  
  analogWrite(buzz, dist);
  
  
  Serial.println(dist);
  
  delay(100);

}
