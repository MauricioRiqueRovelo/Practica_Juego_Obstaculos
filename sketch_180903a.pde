class Avatar{
  //atributos
  int x,y;
  int t;
  int v;
  color c;
  //metodos  
  Avatar(){
    this.x = width/2;
    this.y = height/2;
    this.t = 40;
    this.c = color(255,0,0);
    this.v = 5;
  }
  /*
  void mover(){
  }
  */
  
  void mDerecha(){
    this.x+=this.v;
  }
  
  void mIzquierda(){
    this.x-=this.v;
  }
  
  void mArriba(){
    this.y-= this.v;
  }
  
  void mAbajo(){
    this.y+=this.v;
  }
  void limites(){
  x = constrain(this.x, 0, (400-this.t));
  y = constrain(this.y, 0, (400-this.t));
  }
  
  void display(){
    fill(this.c);
    noStroke();
    rect(this.x,this.y,this.t,this.t);
  }
}


class Objetivo{
  int x,y;
  int d;
  
  Objetivo(){
    this.x = round(random(400));
    this.y = round(random(400));
    this.d = 10;
  }
  
  void display(){
    fill(0);
    ellipse(this.x,this.y,this.d,this.d);
  }
}


class Enemigo{
  int x,y;
  int t;
  int r, g, b;
  int dx, dy;
  Avatar avatar;
  
  Enemigo(int x_, int y_, int t_, int r_, int g_, int b_, int dx_, int dy_){
    x = x_;
    y = y_;
    t = t_;
    r = r_;
    g = g_;
    b = b_;
    dx = dx_;
    dy = dy_;
  }
  
  void display(){
    boolean hit = impacto();
    if (hit){
      fill (255, 0, 255);
    }  else {
      fill (0, 0, 255);
    }
    noStroke();
    ellipse (this.x, this.y, this.t, this.t);
    
  }
  
  void mover(){
    this.x += this.dx;
    this.y += this.dy;
    rebota();
  }
  
  void rebota(){
    if (this.x > (400-this.t/2)){
      this.dx *= -1;
  } else if (this.x < (this.t/2)){
      this.dx *= -1;  
  } else if (this.y > (400-this.t/2)){
      this.dy *= -1;
  } else if (this.y < (this.t/2)){
      this.dy *= -1;
  }
}

  
  boolean impacto(){
    float testX = this.x;
    float testY = this.y;
    
    if (this.x < personaje.x)                      testX = personaje.x;
    else if (this.x > personaje.x+personaje.t)     testX = personaje.x+personaje.t;
    
    if (this.y < personaje.y)                      testY = personaje.y;
    else if (this.y > personaje.y+personaje.t)     testY = personaje.y+personaje.t;
    
    
    float distX = this.x-testX;
    float distY = this.y-testY;
    float distance = sqrt((distX*distX)+(distY*distY));
    
    if (distance <= (this.t/2)){
      return true;
    }
      return false;
  }
/*
    void colision(){
      float radio = personaje.t/2;
      float distX = this.x - personaje.x - radio;
      float distY = this.y - personaje.y - radio;
      float dx = this.x + personaje.x;
      float dy = this.y + personaje.y;
      
      if (distX <= radio || distY <= radio){
      r = 255;
      g = 0;
      b = 255;
      } else {
      r = 0;
      g = 0;
      b = 255;
      }
    }

      
    /*float d2p;
    float distX = this.x - personaje.x;
    float distY = this.y - personaje.y;
    
    d2p = sqrt(sq(distX) + sq(distY));
    
    float distancia = this.t + personaje.t/TWO_PI ;
    
    if (d2p < personaje.t){
      r = 255;
      g = 0;
      b = 255;
    } else if (d2p > personaje.t){
      r = 0;
      g = 0;
      b = 255;
    }*/
  }


Avatar personaje;
ArrayList <Objetivo> objetivos;
Enemigo obstaculo1;
Enemigo obstaculo2;

void setup(){
  size(400,400);
  personaje = new Avatar();
  objetivos = new ArrayList <Objetivo>();
  for (int i= 0; i<20; i++){
    objetivos.add(new Objetivo());
    Objetivo part = objetivos.get(i);
  }
  obstaculo1 = new Enemigo(300, 100, 100, 0, 0, 255, 2, 3);
  obstaculo2 = new Enemigo(100, 300, 100, 0, 0, 255, 1, 4);
}

void draw(){
  background(255);
  for (Objetivo part : objetivos){
    part.display();
  }
 personaje.display();
 personaje.limites();
 obstaculo1.display();
 obstaculo1.mover();
 obstaculo2.display();
 obstaculo2.mover();
 
  if(keyPressed){
    switch(key){
    case 'a':
      personaje.mIzquierda();
    break;
    case 'w':
      personaje.mArriba();
    break;
    case 's':
      personaje.mAbajo();
    break;
    case 'd':
      personaje.mDerecha();
    break;
  }
  
  }
  
  
  
  
  
  /*
  int px = mouseX;
  int py = mouseY;
  
  //ellipse(constrain(px,100,300),py,20,20);
  /*if(mousePressed){
    println(mouseX);
  }
  */
}

/*
void mousePressed(){
  println("mouse presionado");
}
*/

/*
void keyPressed(){
  println(key);
  switch(key){
    case 'a':
      personaje.mIzquierda();
    break;
    case 'w':
      personaje.mArriba();
    break;
    case 's':
      personaje.mAbajo();
    break;
    case 'd':
      personaje.mDerecha();
    break;
  }
  
}
*/
