void addDraw() {
  if (mousePressed) {
    if (inside(mouseX, mouseY)) {
      for (int i = -5; i < 5; i++) {
        for (int j = -5; j < 5; j++) {
          gra(mouseX+i, mouseY+j, draw);
        }
      }
    }
  }
}

void applyDown() {
  refreshArray();
  for (int i = width-1; i >=0; i--) {
    for (int j = 0; j < height; j++) {
      if (gra(i, j) > 0) {
        if (properties[gra(i, j)][0]>0) {
          if (random(100)<properties[gra(i, j)][1]) {
            if (gra(i, j+1) == 0 && newGra(i, j+1) == 0) {
              jump(i, j, 0, 1);
              //mody++;
            }
          }
        }
      }
    }
  }
}

void applySide() {
  refreshArray();
  for (int i = 0; i <width; i++) {
    for (int j = 0; j < height; j++) {
      if (gra(i, j) > 0) {
        if (properties[gra(i, j)][2]>0) {
          if(gra(i+1,j) == 0){
            if(gra(i-1,j) == 0){
              if(random(50)<properties[gra(i, j)][3]){
                if(random(100)<50){
                  realMove(i,j,i+1,j);
                } else {
                  realMove(i,j,i-1,j);
                }
              } else {
                //realMove(i,j,i,j);
              }
            } else {
              if(random(50)<properties[gra(i, j)][3]){
                realMove(i,j,i+1,j);
              } else {
                //realMove(i,j,i,j);
              }
            }
          } else {
            if(gra(i-1,j) == 0){
              if(random(50)<properties[gra(i, j)][3]){
                realMove(i,j,i-1,j);
              } else {
                //realMove(i,j,i,j);
              }
            } else {
              //realMove(i,j,i,j);
            }
          }
        }
      }
    }
  }
}

void render(){
  loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      pixels[j*width+i] = colors[gra(i, j)];
    }
  }
  updatePixels();
}
