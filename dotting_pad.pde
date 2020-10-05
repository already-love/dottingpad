ArrayList<Button> pois;
float dotdiameter;

void setup(){  
   float dotpo=200;
   dotdiameter=40;    // the diameter of each dots
   size(1200, 1200);  
   background(192, 64, 0);  //color the background as orange-red
   
   pois = new ArrayList<Button>();  //the arraylist of the buttons
   
   for(int i=1;i<6;++i){
     for (int j=1;j<6;++j){
       pois.add(new Button(dotpo*i,dotpo*j));
     }
   }
}

void draw(){
  update();
  noStroke();
  ellipseMode(CENTER);
  for(int i=0;i<pois.size();i++) {
    if(pois.get(i).isselected==true){
      fill(192, 64, 0);
    }else if(pois.get(i).isover==true){
      fill(200);
    }else{
      fill(255);
    }
    ellipse(pois.get(i).x,pois.get(i).y,dotdiameter,dotdiameter);
  }
}

class Button{
  float x;
  float y;
  boolean isover=false;
  boolean isselected=false;
  Button(float pox,float poy){
    x=pox;
    y=poy;
  }
  
}

void mousePressed(){
  for(int i=0;i<pois.size();i++) {
    if(pois.get(i).isover==true){
      pois.get(i).isselected=true;
    }else{
      pois.get(i).isselected=false;
    }
  }
}

void update() {
  for(int i=0;i<pois.size();i++) {
    if (overDot(pois.get(i).x, pois.get(i).y, dotdiameter) ) {
      pois.get(i).isover = true;
    }else {
      pois.get(i).isover = false;
    }
  }
}

boolean overDot(float x, float y, float diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
