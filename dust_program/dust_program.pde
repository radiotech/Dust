
//color tempPixels[];
int gra[];
int readGra[];
color colors[];

void setup(){
  size(500,500);
  frameRate(3000);
  noSmooth();
  gra = new int[width*width+height];
  readGra = new int[width*width+height];
  
  for(int i = 0; i < width*width+height; i++){
    gra[i] = 0;
  }
  
  colors = new color[32];
  colors[0] = color(0);
  colors[1] = color(255);
  
}
  
void draw(){
  loadPixels();
  arrayCopy(gra,readGra);
  
  if(mousePressed){
    if(inside(mouseX,mouseY)){
      gra(mouseX,mouseY,1);
    }
  }
  
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      if(gra(i,j) > 0){
        
        gra(i,j,0);
        gra(i,j-1,1);
        
      }
    }
  }
  
  
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      
      pixels[j*width+i] = colors[gra(i,j)];
    }
  }
  
  updatePixels();
}

boolean inside(int a, int b){
  if(a >= 0 && b >= 0){
    if(a < width && b < height){
      return true;
    }
  }
  return false;
}

int gra(int a, int b){
  if(inside(a,b)){
    return readGra[b*width+a];
  } else {
    return 0;
  }
}

void gra(int a, int b, int c){
  if(inside(a,b)){
    gra[b*width+a] = c;
  }
}

