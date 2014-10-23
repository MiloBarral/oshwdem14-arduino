import processing.serial.*;

int MINANG=0;
int MAXANG=180;
int MAX_DISTANCE = 100;
int PASO = 1;
int MAXX=200;
int MAXY=200;
int MAXD=75;
int MEMORIA=5;
int TAMP=15;
int DECP=TAMP/MEMORIA;
float d=-1;
int a=0;
int s=1;
int time=0;
String puntos="";
int i=0;

void setup() {   
    background(255);
    size(200, 200); 
} 

void draw() { 
    pantalla();
    scanline();
    // solo pruebas! los datos los proporciona serialEvent
//    if (hayDatos())  guardarPunto();
    obtenerDatos();
    pintarPuntos();
}

void pantalla() {
    background(120);   
    for(int i=0; i<MAXX; i+=10) {
        line(i,0,i,MAXY);
        line(0,i,MAXX,i);
    }
    ellipse(MAXX/2,MAXY/2,MAXD+MAXD,MAXD+MAXD);
}

void punto(int dp, float ap, int tp) {
        float b= TWO_PI - radians(ap);    
        float x = dp*cos(b);
        float y = dp*sin(b);
        ellipse(MAXX/2+x,MAXX/2+y,TAMP-tp,TAMP-tp);
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

bool hayDatos() {
    bool r=false;
    if( millis() > time ) {
        a+=s*PASO;
        if (a>=MAXANG) {s=-1}
        if (a<=MINANG) {s=1}        
        d = random(MAXD);
        time = millis() + 200;
        r = (d>=0);
    } 
    return r;
}

void obtenerDatos() {
    if (hayDatos()) guardarPunto();
}

void guardarPunto() {
        if (puntos.length() > 0) 
            puntos = str(a) + "," + str(d) + ";" + puntos; 
        else 
            puntos = str(a) + "," + str(d);
        if (i >= MEMORIA) 
            puntos = puntos.substring(0,lastindex(puntos,';'));           
        else
            i++;    
}

void pintarPuntos() {
    String[] p = split(puntos,";");
    for (int f=0; f<p.length(); f++) {
        String[] v = split(p[f], ",");  
        punto(int(v[1]),float(v[0]),DECP*f);
    }
}

int lastindex(String s, char c) {
    int i= s.length()-1;
    String sc=str(c);
    while ((str(s.charAt(i)) != sc) && (i>=0)) i--;
    return i;
}

