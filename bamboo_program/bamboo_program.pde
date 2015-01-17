
void setup(){
  size(500,500);
  background(255);
  stroke(0,255,0);
  point(width/2,height/2);
}
  
void draw(){
  
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      stroke(random(255),random(255),random(255));
      point(i,j);
    }
  }
  
}
