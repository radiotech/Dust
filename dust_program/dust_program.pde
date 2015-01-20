//color tempPixels[];
int gra[];
int readGra[];
color colors[];
int properties[][];
int draw = 3;

void setup(){
  size(500,500);
  frameRate(30);
  
  gra = new int[width*width+height];
  readGra = new int[width*width+height];
  colors = new color[32];
  properties = new int[32][10];
  
  for(int i = 0; i < width*width+height; i++){
    gra[i] = 0;
  }
  
  for(int i = 0; i < width; i++){
    gra(0,i,1);
    gra(width-1,i,1);
    gra(i,0,1);
    gra(i,width-1,1);
  }
  
  colors[0] = color(0);
  colors[1] = color(255,0,0);
  colors[2] = color(150,255,0);
  properties[2][0]=1;
  properties[2][1]=10;
  colors[3] = color(0,0,255);
  properties[3][0]=1;
  properties[3][1]=90;
  properties[3][2]=1;
  properties[3][3]=90;
  
}
  
void draw(){
  
  //gra = new int[width*width+height];
  
  addDraw();
  
  applyDown();
  applySide();
  //applyUp();
  
  render();
  
  text(frameRate,20,20);
}
