import processing.serial.*;

int MINANG=0;
int MAXANG=180;
int MAX_DISTANCE = 100;
int TAMP=15;
int PASO = 1;
int MAXX=200;
int MAXY=200;
int MAXD=75;
int d=MAXD;
int dp=-1;
int a=0;
int time=2;
float xp=0;
float yp=0;

void setup() {   
    background(255);
    size(200, 200); 
} 

void draw() { 

    pantalla();
    float b= TWO_PI - radians(a);
    float x = d*cos(b);
    float y = d*sin(b);
    line(MAXX/2,MAXX/2,MAXX/2+x,MAXY/2+y);
    if (a>=MAXANG) {s=-1}
    if (a<=MINANG) {s=1}
    a+=s*PASO;
    if( millis() > time ) {
        dp = random(MAXD);
        xp = dp*cos(b);
        yp = dp*sin(b);
        time = millis() + 2000;
    }
    if (dp>=0) {
        ellipse(MAXX/2+xp,MAXX/2+yp,TAMP,TAMP);
    }
}

void pantalla() {
    background(120);   
    for(int i=0; i<MAXX; i+=10) {
        line(i,0,i,MAXY);
        line(0,i,MAXX,i);
    }
    ellipse(MAXX/2,MAXY/2,d+d,d+d);
}


void serialEvent(Serial cPort) {  
    comPortString = cPort.readString();  
    if (comPortString != null) {    
        comPortString=trim(comPortString);    
        String[] values = split(comPortString, ',');    
        try {      
            a = Integer.parseInt(values[0]);      
            dp = Integer.parseInt(values[1]) / MAX_DISTANCE * MAXD;
//d = int(map(Integer.parseInt(values[1]), 1, MAX_DISTANCE, 1, radius));
        } catch (Exception e) {}  
    }
}
