import processing.serial.*;

int MINANG=0;
int MAXANG=180;
int MAX_DISTANCE = 100;
int TAMP=15;
int DECP=5;
int PASO = 1;
int MAXX=200;
int MAXY=200;
int MAXD=75;
int d=-1;
int a=0;
int s=1;
float x;
float y;
int time=0;
int perp=0;

String comPortString;
Serial myPort;
 

void setup() {   
    background(255);
    size(200, 200); 
    myPort = new Serial(this, Serial.list()[0] , 9600);
    myPort.bufferUntil('\n'); // Trigger a SerialEvent on new line
} 

void draw() { 
    pantalla();
    scanline();
    obtenerDatos(); // solo pruebas! los datos los proporciona serialEvent
    punto(d,a,perp);
}

void pantalla() {
    background(120);   
    for(int i=0; i<MAXX; i+=10) {
        line(i,0,i,MAXY);
        line(0,i,MAXX,i);
    }
    ellipse(MAXX/2,MAXY/2,MAXD+MAXD,MAXD+MAXD);
}

void punto(int dp, int ap, int pers) {
    if (dp>=0) { 
        float b= TWO_PI - radians(ap);    
        float x = dp*cos(b);
        float y = dp*sin(b);
        ellipse(MAXX/2+x,MAXX/2+y,TAMP-pers,TAMP-pers);
    }
}

void scanline() {
    float b= TWO_PI - radians(a);
    float x = MAXD*cos(b);
    float y = MAXD*sin(b); 
    line(MAXX/2,MAXX/2,MAXX/2+x,MAXY/2+y);
}
    
void serialEvent(Serial cPort) {  
    comPortString = cPort.readString();  
    if (comPortString != null) {    
        comPortString=trim(comPortString);    
        String[] values = split(comPortString, ',');    
        try {      
            a = Integer.parseInt(values[0]);      
            d = Integer.parseInt(values[1]) / MAX_DISTANCE * MAXD;
        } catch (Exception e) {}  
    }
}

void obtenerDatos() {
    if( millis() > time ) {
        a+=s*PASO;
        if (a>=MAXANG) {s=-1}
        if (a<=MINANG) {s=1}        
        d = random(MAXD);
        time = millis() + 200;
    } 
}

