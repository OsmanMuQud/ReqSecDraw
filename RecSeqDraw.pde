static Recaman rec;
int scl;
import processing.sound.*;
Sound s;
SinOsc pul;
//notes to play with each update
float notes[]={440.0,466.16,493.88,523.25,554.37,587.33,622.25,659.25,698.46,739.99,783.99,830.61,880};
void setup()
{
  size(1800,800);
  background(0);
  //takes the user defined value and then evaluates the recaman series 
  //and stores in the object
  rec=new Recaman(100);
  rec.evaluate();
  //this sets the type of sound to be played remove
  //pul= new SinOsc(this);
  //s=new Sound(this);
}
int fc=0;
void draw()
{
  //pul.play(notes[fc%rec.series.size()%notes.length],0.9);
  background(25);//map(mouseX,0,width,0,255));
  noFill();
  
  strokeWeight(1);
  frameRate(8);
  fc++;
  
  fc%=rec.series.size();
  for(int i=1;i<fc;i++)
  {
    colorMode(HSB);
    stroke(map(i,1,rec.series.size(),0,255),150,255);
    float x=rec.series.get(i-1)+rec.series.get(i);
    //calculates the center point of 2 points to draw a semicircle
    float nx=map(x/2,0,rec.largest,0,width);
    //x+=25;
    float y=height/2;
    float r=abs(rec.series.get(i-1)-rec.series.get(i));
    //this is the radius calculated 
    float nr=map(r,0,rec.largest,0,width);
    //draws the semicircle on alternative sides
    if(i%2==0)
    arc(nx,y,nr,nr,0,PI);
    else
    arc(nx,y,nr,nr,-PI,0);
  }
  //noLoop();
  //pul.stop();
 // s.volume(300);
 //saves the result once the complete figure is drawn
 if(fc==rec.series.size()-1){
    saveFrame("Result.png");
   }
 
  
}
void mousePressed()
{
  saveFrame("/file.png");
}
