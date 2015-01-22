boolean inside(int a, int b){
  if(a >= 0 && b >= 0){
    if(a < width && b < height){
      return true;
    }
  }
  return false;
}

void refreshArray(){
  //gra = newGra;
  //gra = new int[];
  arrayCopy(gra,readGra);
}

int newGra(int a, int b){
  if(inside(a,b)){
    return gra[b*width+a];
  } else {
    return 0;
  }
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

boolean jump(int a, int b, int h, int v){
  int tempGras = newGra(a,b);
  gra(a,b,newGra(a+h,b+v));
  gra(a+h,b+v,tempGras);
  return true;
}
/*
int moveDown(int a, int b){
  if(newGra(a,b+1)==0){
    return 1;
  } else {
    return 0;
  }
}

int moveDown(int a, int b, int c){
  if(random(100,101) < c){
    return moveDown(a,b);
  } else {
    return 0;
  }
}


*/

void realMove(int a, int b, int c, int d){
  if(newGra(c,d) == 0){
    jump(a, b, c-a, d-b);
  } else {
    
    if(choose(properties[newGra(c,d)][3],properties[gra(a,b)][3])){
      jump(a, b, 0, 0);
    } else {
      jump(c, d, -1, 0);
      jump(a, b, c-a, d-b);
    }
    
  }
}

boolean choose(int a, int b){
  if(random(100)<a*100/(a+b)){
    return true;
  }
  return false;
}
/*
int moveSide(int a, int b){
  if(newGra(a+1,b)==0){
    if(newGra(a-1,b)==0){
      if(floor(random(2))==0){
        return 1;
      } else {
        return -1;
      }
    } else {
      return 1;
    }
  } else {
    if(newGra(a-1,b)==0){
      return -1;
    } else {
      return 0;
    }
  }
}

int moveSide(int a, int b, int c){
  if(random(100) < c){
    return moveSide(a,b);
  } else {
    return 0;
  }
}

boolean moveStay(int a, int b){
  return jump(a,b,0,0);
}
*/
