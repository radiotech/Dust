
float spread = 30;
float water = 50;
float sun = 50;
float waterNeed = 0;
float sunNeed = 0;
float spreadT = 250;

color tempPixels[];

void setup(){
  size(500,500);
  background(92,51,23);
  stroke(0,255,0);
  noSmooth();
  strokeWeight(10);
  point(width/2,height/2);
  strokeWeight(1);
}
  
void draw(){
  loadPixels();
  tempPixels = pixels;
  stroke(254,255,0);
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      if(live(i,j)){
        
        //int d = pixels[b*width+a];
        //pixels[(j+floor(random(10)-5))*width+(i+floor(random(10)-5))] = color(0,255,0);
        
        int liveAround = 0;
        float tempSun = pixelRed(i,j);
        float tempWater = pixelBlue(i,j);
        
        if(live(i+1,j)){
          liveAround++;
          pixelsRed(i+1,j,tempSun/spread);
          pixelsBlue(i+1,j,tempWater/spread);
        }
        if(live(i-1,j)){
          liveAround++;
          pixelsRed(i-1,j,tempSun/spread);
          pixelsBlue(i-1,j,tempWater/spread);
        }
        if(live(i,j+1)){
          liveAround++;
          pixelsRed(i,j+1,tempSun/spread);
          pixelsBlue(i,j+1,tempWater/spread);
        }
        if(live(i,j-1)){
          liveAround++;
          pixelsRed(i,j-1,tempSun/spread);
          pixelsBlue(i,j-1,tempWater/spread);
        }
        
        tempSun -= tempSun/spread*liveAround;
        tempWater -= tempWater/spread*liveAround;
        
        tempSun += (float(5-liveAround)/5*sun)-sunNeed;
        tempWater += water/(liveAround+1)-waterNeed;
        
        
        if(liveAround < 4){
          if(tempSun>spreadT){
            if(tempWater>spreadT){
              int search = floor(random(4));
              for(int k = 0; k < 4; k++){
                if(search == 0){
                  if(live(i+1,j) == false){
                    pixels(i+1,j,tempSun/4,253,tempWater/4);
                    search = 5;
                  }
                }
                if(search == 1){
                  if(live(i-1,j) == false){
                    pixels(i-1,j,tempSun/4,253,tempWater/4);
                    search = 5;
                  }
                }
                if(search == 2){
                  if(live(i,j+1) == false){
                    pixels(i,j+1,tempSun/4,253,tempWater/4);
                    search = 5;
                  }
                }
                if(search == 3){
                  if(live(i,j-1) == false){
                    pixels(i,j-1,tempSun/4,253,tempWater/4);
                    search = 5;
                  }
                }
                search++;
                if(search == 4){
                  search = 0;
                }
              }
              tempSun = tempSun/4*3;
              tempWater = tempWater/4*3;
            }
          }
        }
        
        
        pixels(i,j,tempSun,255,tempWater);
      }
    }
  }
  
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      makeLive(i,j);
    }
  }
  updatePixels();
}

boolean live(int a, int b){
  if(pixelGreen(a,b) == 255){
    return true;
  } else {
    return false;
  }
}

void makeLive(int a, int b){
  if(pixelGreen(a,b) == 253){
    pixelsGreen(a,b,255);
  }
}

boolean inside(int a, int b){
  if(a >= 0 && b >= 0){
    if(a < width && b < height){
      return true;
    }
  }
  return false;
}

float pixelRed(int a, int b){
  if(inside(a,b)){
    return red(tempPixels[b*width+a]);
  } else {
    return 254;
  }
}
float pixelGreen(int a, int b){
  if(inside(a,b)){
    return green(tempPixels[b*width+a]);
  } else {
    return 254;
  }
}
float pixelBlue(int a, int b){
  if(inside(a,b)){
    return blue(tempPixels[b*width+a]);
  } else {
    return 254;
  }
}

void pixelsRed(int a, int b, float c){
  if(inside(a,b)){
    color d = pixels[b*width+a];
    pixels[b*width+a] = color(red(d)+c,green(d),blue(d));
  }
}
void pixelsGreen(int a, int b, float c){
  if(inside(a,b)){
    color d = pixels[b*width+a];
    pixels[b*width+a] = color(red(d),green(d)+c,blue(d));
  }
}
void pixelsBlue(int a, int b, float c){
  if(inside(a,b)){
    color d = pixels[b*width+a];
    pixels[b*width+a] = color(red(d),green(d),blue(d)+c);
  }
}

void pixels(int a, int b, float r, float g, float bb){
  if(inside(a,b)){
    pixels[b*width+a] = color(r,g,bb);
  }
}
