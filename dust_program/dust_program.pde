


float spread = 30;
float water = 33;
float sun = 22;
float waterNeed = 8;
float sunNeed = 8;
float spreadT = 254;
float dieT = 1;

color tempPixels[];
float reds[];
float greens[];
float blues[];

void setup(){
  size(500,500);
  frameRate(1000);
  background(92,51,23);
  stroke(0,255,0);
  noSmooth();
  //strokeWeight(10);
  //point(width/2,height/2);
  
  reds = new float[width*width+height];
  greens = new float[width*width+height];
  blues = new float[width*width+height];
  
  for(int i = 0; i < width*width+height; i++){
    reds[i] = 92;
    greens[i] = 51;
    blues[i] = 23;
  }
  reds[(height/2)*height+(width/2)] = 255;
  greens[(height/2)*height+(width/2)] = 255;
  blues[(height/2)*height+(width/2)] = 255;
  //strokeWeight(1);
}
  
void draw(){
  loadPixels();
  //tempPixels = pixels;
  stroke(254,255,0);
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      if(live(i,j)){
        
        //int d = pixels[b*width+a];
        //pixels[(j+floor(random(10)-5))*width+(i+floor(random(10)-5))] = color(0,255,0);
        
        int liveAround = 0;
        int index = j*height+i;
        //float tempSun = reds[index];
        //float tempWater = blues[index];
        
        if(live(i+1,j)){
          liveAround++;
          pixelsRed(i+1,j,reds[index]/spread);
          pixelsBlue(i+1,j,blues[index]/spread);
        }
        if(live(i-1,j)){
          liveAround++;
          pixelsRed(i-1,j,reds[index]/spread);
          pixelsBlue(i-1,j,blues[index]/spread);
        }
        if(live(i,j+1)){
          liveAround++;
          pixelsRed(i,j+1,reds[index]/spread);
          pixelsBlue(i,j+1,blues[index]/spread);
        }
        if(live(i,j-1)){
          liveAround++;
          pixelsRed(i,j-1,reds[index]/spread);
          pixelsBlue(i,j-1,blues[index]/spread);
        }
        
        reds[index] -= reds[index]/spread*liveAround;
        blues[index] -= blues[index]/spread*liveAround;
        
        reds[index] += (float(5-liveAround)/5*sun)-sunNeed;
        blues[index] += water/(liveAround+1)-waterNeed;
        
        if(reds[index]<dieT || blues[index]<dieT){
          reds[index] = 92;
          greens[index] = 51;
          blues[index] = 23;
        }
        
        if(liveAround < 4){
          if(reds[index]>spreadT){
            if(blues[index]>spreadT){
              int search = floor(random(4));
              for(int k = 0; k < 4; k++){
                if(search == 0){
                  if(live(i+1,j) == false){
                    pixels(i+1,j,reds[index]/4,253,blues[index]/4);
                    search = 5;
                  }
                }
                if(search == 1){
                  if(live(i-1,j) == false){
                    pixels(i-1,j,reds[index]/4,253,blues[index]/4);
                    search = 5;
                  }
                }
                if(search == 2){
                  if(live(i,j+1) == false){
                    pixels(i,j+1,reds[index]/4,253,blues[index]/4);
                    search = 5;
                  }
                }
                if(search == 3){
                  if(live(i,j-1) == false){
                    pixels(i,j-1,reds[index]/4,253,blues[index]/4);
                    search = 5;
                  }
                }
                search++;
                if(search == 4){
                  search = 0;
                }
              }
              reds[index] *= 3/4;
              blues[index] *= 3/4;
            }
          }
        }
        
      }
    }
  }
  
  for(int i = 0; i < width; i++){
    for(int j = 0; j < height; j++){
      makeLive(i,j);
      pixels[j*width+i] = color(reds[j*width+i],greens[j*width+i],blues[j*width+i]);
    }
  }
  
  if(inside(mouseX,mouseY)){
    println("Red: "+reds[mouseY*width+mouseX]+", Green: "+greens[mouseY*width+mouseX]+", Blue: "+blues[mouseY*width+mouseX]);
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
    return red(pixels[b*width+a]);
  } else {
    return 254;
  }
}
float pixelGreen(int a, int b){
  if(inside(a,b)){
    return green(pixels[b*width+a]);
  } else {
    return 254;
  }
}
float pixelBlue(int a, int b){
  if(inside(a,b)){
    return blue(pixels[b*width+a]);
  } else {
    return 254;
  }
}

void pixelsRed(int a, int b, float c){
  if(inside(a,b)){
    reds[b*width+a] += c;
  }
}
void pixelsGreen(int a, int b, float c){
  if(inside(a,b)){
    greens[b*width+a] += c;
  }
}
void pixelsBlue(int a, int b, float c){
  if(inside(a,b)){
    blues[b*width+a] += c;
  }
}

void pixels(int a, int b, float r, float g, float bb){
  if(inside(a,b)){
    reds[b*width+a] = r;
    greens[b*width+a] = g;
    blues[b*width+a] = bb;
  }
}
