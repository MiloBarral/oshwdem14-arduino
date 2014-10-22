import processing.serial.*;

int MINANG=0;
int MAXANG=180;
int MAX_DISTANCE = 100;
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
int MEMORIA=5;
int TAMP=15;
int DECP=TAMP/MEMORIA;
String puntos[MEMORIA];
int i=0;

void setup() {   
    background(255);
    size(200, 200); 
} 

void draw() { 
    pantalla();
    scanline();
    obtenerDatos(); // solo pruebas! los datos los proporciona serialEvent
    if (dp>=0) { 
	puntos[i] = str(ap) + "," + str(dp);
	i = (i + 1) % MEMORIA;
    } 
    for (int f=i-1; f>=0; f--) {
	String[] v = split(puntos[f], ',');    
	punto(Integer.parseInt(v[0]),Integer.parseInt(v[1]),DECP*(i-f-1));
    }
   
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
        float b= TWO_PI - radians(ap);    
        float x = dp*cos(b);
        float y = dp*sin(b);
        ellipse(MAXX/2+x,MAXX/2+y,TAMP-pers,TAMP-pers);
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

