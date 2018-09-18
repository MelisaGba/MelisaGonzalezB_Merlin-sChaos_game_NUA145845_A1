import ddf.minim.*;

//variables globales

PFont titulo, selec;
int pantalla= 0;
int turno = 0;
int player1;
int player2;
int vida1 = 100;
int vida2 = 100;

//---------------------AUDIO---------------------

Minim music;
AudioPlayer music_1;
AudioPlayer music_2;
AudioPlayer music_3;

//---------------------CLASES----------------------
class Game {
  //atributos
  int x, y;
  int t;


  Game(int x_, int y_) {
    x = x_;
    y = y_;
    this.t = 7;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    noStroke();

    //amarillo
    fill(227, 229, 102);
    rect(t*6, t*4, t*100, t*20);
    rect(t*4, t*6, t*2, t*16);
    rect(t*106, t*6, t*2, t*16);


    //morado
    fill(78, 87, 114);
    rect(t*6, t*3, t*100, t);
    rect(t*5, t*3, t, t*2);
    rect(t*106, t*3, t, t*2);
    rect(t*5, t*23, t, t*2);
    rect(t*106, t*23, t, t*2);
    rect(t*6, t*24, t*100, t);
    rect(t*3, t*6, t, t*16);
    rect(t*108, t*6, t, t*16);
    rect(t*3, t*5, t*3, t);
    rect(t*106, t*5, t*3, t);
    rect(t*3, t*22, t*3, t);
    rect(t*106, t*22, t*3, t);

    //JUGADOR 1
    fill(255);
    rect(t*24, t*8, t*4, t*4);//up
    rect(t*25, t*7, t*2, t);//up
    rect(t*25, t*12, t*2, t);//up
    rect(t*23, t*9, t, t*2);//up
    rect(t*28, t*9, t, t*2);//up

    rect(t*16, t*16, t*4, t*4);//izq
    rect(t*17, t*15, t*2, t);//up
    rect(t*17, t*20, t*2, t);//up
    rect(t*15, t*17, t, t*2);//up
    rect(t*20, t*17, t, t*2);//up

    rect(t*24, t*16, t*4, t*4);//abaj
    rect(t*25, t*15, t*2, t);//ab
    rect(t*25, t*20, t*2, t);//ab
    rect(t*23, t*17, t, t*2);//a
    rect(t*28, t*17, t, t*2);//ab

    rect(t*32, t*16, t*4, t*4);//der
    rect(t*33, t*15, t*2, t);//der
    rect(t*33, t*20, t*2, t);//der
    rect(t*31, t*17, t, t*2);//der
    rect(t*36, t*17, t, t*2);//der


    //JUGADOR 2
    rect(t*84, t*8, t*4, t*4);//up
    rect(t*85, t*7, t*2, t);//up
    rect(t*85, t*12, t*2, t);//up
    rect(t*83, t*9, t, t*2);//up
    rect(t*88, t*9, t, t*2);//up

    rect(t*92, t*16, t*4, t*4);//DER
    rect(t*93, t*15, t*2, t);//der
    rect(t*93, t*20, t*2, t);//de
    rect(t*91, t*17, t, t*2);//de
    rect(t*96, t*17, t, t*2);//de

    rect(t*84, t*16, t*4, t*4);//abaj
    rect(t*85, t*15, t*2, t);//ab
    rect(t*85, t*20, t*2, t);//ab
    rect(t*83, t*17, t, t*2);//a
    rect(t*88, t*17, t, t*2);//ab

    rect(t*76, t*16, t*4, t*4);//iz
    rect(t*77, t*15, t*2, t);//iz
    rect(t*77, t*20, t*2, t);//iz
    rect(t*75, t*17, t, t*2);//iz
    rect(t*80, t*17, t, t*2);//iz

    fill(202);
    //CTRL
    rect(t*67, t*17, t*5, t*4);//iz
    rect(t*68, t*16, t*3, t);//iz
    rect(t*68, t*21, t*3, t);//iz
    rect(t*66, t*18, t, t*2);//iz
    rect(t*72, t*18, t, t*2);//iz

    //SHIFT
    rect(t*71, t*8, t*9, t*4);
    rect(t*72, t*7, t*7, t);
    rect(t*72, t*12, t*7, t);
    rect(t*70, t*9, t, t*2);
    rect(t*80, t*9, t, t*2);

    rect(t*33, t*8, t*4, t*4);//e
    rect(t*34, t*7, t*2, t);//e
    rect(t*34, t*12, t*2, t);//e
    rect(t*32, t*9, t, t*2);//e
    rect(t*37, t*9, t, t*2);//e

    rect(t*16, t*8, t*4, t*4);//q
    rect(t*17, t*7, t*2, t);//q
    rect(t*17, t*12, t*2, t);//q
    rect(t*15, t*9, t, t*2);//q
    rect(t*20, t*9, t, t*2);//q

    textFont(selec);
    textSize(17);
    fill(0);
    text("W", 173, t*11);
    text("S", 176, t*19);
    text("A", 118, t*19);
    text("D", 232, t*19);
    text("E", 240, t*11);
    text("Q", 118, t*11);

    textSize(11);
    text("SHIFT", 502, 77);
    text("CTRL", 467, 140);


    triangle(t*85, t*10.5, t*86, t*9.5, t*87, t*10.5);
    triangle(t*85, t*17.5, t*86, t*18.5, t*87, t*17.5);
    triangle(t*78, t*19, t*78, t*17, t*77, t*18);
    triangle(t*94, t*19, t*94, t*17, t*95, t*18);


    fill(255);
    text("PLAYER 1 ATTACKS WITH 'Q' AND 'E' PLAYER 2 ATTACKS WHIT 'SHIFT' AND 'CTRL'", 290, 65, 200, 300);

    popMatrix();
  }
}

class Palo {
  //atributos
  int x, y;
  int t;
  int v;
  float c;

  Palo(int x_, int y_) {
    x = x_;
    y = y_;
    this.t = 6;
    this.v = 8;
    this.c = 3.5;
  }
  void movMen() {
    this.x = this.x + 2;
    if (this.x>=800) {
      this.x = -35*t;
    }
  }
  void display() {
    pushMatrix();
    translate(x, y);


    //PATAS
    fill(129, 108, 91);
    rect(c*10, c*21, c, c);
    rect(c*9, c*22, c, c);
    rect(c*10, c*23, c*2, c);

    fill(155, 143, 143);
    noStroke();
    //cabeza
    rect(t*8, t*4, t*2, t);
    rect(t*9, t*3, t, t*2);
    rect(t*10, t*3, t, t*2);
    rect(t*8, t*5, t*2, t*2);
    rect(t*9, t*7, t, t);
    rect(t*10, t*5, t, t*5);
    rect(t*9, t*11, t, t);
    rect(t, t*13, t*3, t);
    rect(0, t*14, t*3, t);
    rect(0, t*15, t*2, t);
    rect(t*11, t*4, t, t);
    rect(t*3, t*11, t*2, t);
    rect(t*2, t*12, t*7, t);

    //ala
    fill(128, 122, 132);
    noStroke();

    rect(t*9, t*8, t, t*3);
    rect(t*7, t*7, t*2, t*5);
    rect(t*6, t*6, t, t*6);
    rect(t*5, t*5, t, t*7);
    rect(t*4, t*4, t, t*7);
    rect(t*3, t*2, t, t*8);
    rect(t*2, t, t, t*7);


    //detallesMORADO
    fill(136, 100, 155);
    rect(t*3, t*4, t*2, t);
    rect(t*2, t*5, t, t*2);

    fill(100, 155, 138);
    rect(t*3, t*3, t, t);
    rect(t*2, t*4, t, t);

    //pico
    fill(125, 2, 45);
    rect(t*11, t*4, t, t);

    //OJO
    fill(0);
    ellipse(t*10, t*4, 3, 3);
    popMatrix();
  }
}

class Paloma {
  //atributos
  int x, y;
  int t;
  int v;
  int c;

  Paloma(int x_, int y_) {
    x = x_;
    y = y_;
    this.t = 7;
    this.v = 8;
    this.c = 4;
  }


  void mDerecha() {
    this.x+=this.v;
  }

  void mIzquierda() {
    this.x-=this.v;
  }

  void mArriba() {
    this.y-= this.v;
  }

  void mAbajo() {
    this.y+=this.v;
  }

  void movMen() {
    this.x = this.x + 2;
    if (this.x>=800) {
      this.x = -29*t;
    }
  }
  //limites de espacio
  void limitesa() {
    this.x = constrain(this.x, 0, 340-this.t);
    this.y = constrain(this.y, 150, 339-this.t);
  }
  void limitesb() {
    this.x = constrain(this.x, 460, 799-this.t);
    this.y = constrain(this.y, 140, 339-this.t);
  }

  void display() {
    pushMatrix();
    translate(x, y);
    //PATAS
    fill(129, 108, 91);
    rect(c*10, c*21, c, c);
    rect(c*9, c*22, c, c);
    rect(c*8, c*23, c, c);
    rect(c*9, c*24, c, c);
    rect(c*10, c*25, c, c);
    rect(c*11, c*26, c*2, c);

    fill(155, 143, 143);
    noStroke();
    rect(t*8, t*4, t*2, t);
    rect(t*9, t*3, t, t*2);
    rect(t*10, t*3, t, t*2);
    rect(t*8, t*5, t*2, t*2);
    rect(t*9, t*7, t, t);
    rect(t*10, t*5, t, t*5);
    rect(t*9, t*11, t, t);
    rect(t, t*13, t*3, t);
    rect(0, t*14, t*3, t);
    rect(0, t*15, t*2, t);
    rect(t*11, t*4, t, t);

    //ala
    fill(128, 122, 132);
    noStroke();
    rect(t*7, t*7, t*2, t*6);
    rect(t*9, t*8, t, t*3);
    rect(t*6, t*8, t, t*5);
    rect(t*5, t*9, t, t*4);
    rect(t*4, t*10, t, t*3);
    rect(t*3, t*11, t, t*2);
    rect(t*2, t*12, t, t);
    //detallesMORADO
    fill(136, 100, 155);
    rect(t*4, t*10, t*2, t);
    rect(t*5, t*11, t*4, t);

    fill(100, 155, 138);
    rect(t*3, t*11, t*2, t);
    rect(t*4, t*12, t*5, t);

    //pico
    fill(125, 2, 45);
    rect(t*11, t*4, t, t);

    //OJO
    fill(0);
    ellipse(t*10, t*4, 3, 3);
    popMatrix();
  }
  void display1() {
    pushMatrix();
    translate(x, y);
    scale(-1, 1);
    //PATAS
    fill(129, 108, 91);
    rect(c*10, c*21, c, c);
    rect(c*9, c*22, c, c);
    rect(c*8, c*23, c, c);
    rect(c*9, c*24, c, c);
    rect(c*10, c*25, c, c);
    rect(c*11, c*26, c*2, c);

    fill(155, 143, 143);
    noStroke();
    rect(t*8, t*4, t*2, t);
    rect(t*9, t*3, t, t*2);
    rect(t*10, t*3, t, t*2);
    rect(t*8, t*5, t*2, t*2);
    rect(t*9, t*7, t, t);
    rect(t*10, t*5, t, t*5);
    rect(t*9, t*11, t, t);
    rect(t, t*13, t*3, t);
    rect(0, t*14, t*3, t);
    rect(0, t*15, t*2, t);
    rect(t*11, t*4, t, t);

    //ala
    fill(128, 122, 132);
    noStroke();
    rect(t*7, t*7, t*2, t*6);
    rect(t*9, t*8, t, t*3);
    rect(t*6, t*8, t, t*5);
    rect(t*5, t*9, t, t*4);
    rect(t*4, t*10, t, t*3);
    rect(t*3, t*11, t, t*2);
    rect(t*2, t*12, t, t);
    //detallesMORADO
    fill(136, 100, 155);
    rect(t*4, t*10, t*2, t);
    rect(t*5, t*11, t*4, t);

    fill(100, 155, 138);
    rect(t*3, t*11, t*2, t);
    rect(t*4, t*12, t*5, t);

    //pico
    fill(125, 2, 45);
    rect(t*11, t*4, t, t);

    //OJO
    fill(0);
    ellipse(t*10, t*4, 3, 3);
    popMatrix();
  }
}
class Merlin {
  //atributos
  int x, y;
  int t;
  int v;
  int c;//tamaño barita

  //metodos  
  Merlin(int x_, int y_) {
    x = x_;
    y = y_;

    this.t = 7;
    this.v = 8;
    this.c = 4;
  }

  void mDerecha() {
    this.x+=this.v;
  }

  void mIzquierda() {
    this.x-=this.v;
  }

  void mArriba() {
    this.y-= this.v;
  }

  void mAbajo() {
    this.y+=this.v;
  }

  void movMen() {
    this.x = this.x + 2;
    if (this.x>=800) {
      this.x = -29*t;
    }
  }
  //limites de espacio
  void limitesa() {
    this.x = constrain(this.x, 0, 340-this.t);
    this.y = constrain(this.y, 150, 330-this.t);
  }
  void limitesb() {
    this.x = constrain(this.x, 460, 799-this.t);
    this.y = constrain(this.y, 140, 330-this.t);
  }

  void display() {
    pushMatrix();
    fill(76, 146, 177);
    noStroke();
    translate(x, y);

    rect(t*3, t*2, t*3, t);
    rect(t, t*3, t*6, t);
    rect(t*3, t*4, t*7, t);
    rect(t*4, t*5, t*4, t);
    rect(t*2, t*6, t*4, t);
    rect(t, t*7, t*2, t);
    //bata
    rect(t*4, t*9, t*2, t*7);
    rect(t*3, t*10, t, t*6);
    rect(t*6, t*10, t, t*6);
    rect(t*7, t*13, t, t*3);
    rect(t, t*16, t*9, t);
    rect(t*8, t*10, t, t);
    //cabello
    fill(178, 178, 178);
    rect(t*3, t*7, t, t);
    rect(t*4, t*8, t, t);
    rect(t*8, t*5, t, t);
    rect(t*6, t*8, t*2, t*2);
    rect(t*7, t*10, t, t*3);

    //barita
    fill(125);
    rect(c*16, c*14, c, c*5);

    //cara mano
    fill(249, 211, 165);
    rect(t*6, t*6, t*2, t);
    rect(t*4, t*7, t*5, t);
    rect(t*5, t*8, t, t);
    rect(t*9, t*10, t, t);

    //ojo
    fill(0);
    ellipse(t*7, t*7, 3, 4);

    popMatrix();
  }
  void display1() {
    pushMatrix();
    fill(76, 146, 177);
    noStroke();
    translate(x, y);
    scale(-1, 1);

    rect(t*3, t*2, t*3, t);
    rect(t, t*3, t*6, t);
    rect(t*3, t*4, t*7, t);
    rect(t*4, t*5, t*4, t);
    rect(t*2, t*6, t*4, t);
    rect(t, t*7, t*2, t);
    //bata
    rect(t*4, t*9, t*2, t*7);
    rect(t*3, t*10, t, t*6);
    rect(t*6, t*10, t, t*6);
    rect(t*7, t*13, t, t*3);
    rect(t, t*16, t*9, t);
    rect(t*8, t*10, t, t);
    //cabello
    fill(178, 178, 178);
    rect(t*3, t*7, t, t);
    rect(t*4, t*8, t, t);
    rect(t*8, t*5, t, t);
    rect(t*6, t*8, t*2, t*2);
    rect(t*7, t*10, t, t*3);

    //barita
    fill(125);
    rect(c*16, c*14, c, c*5);

    //cara mano
    fill(249, 211, 165);
    rect(t*6, t*6, t*2, t);
    rect(t*4, t*7, t*5, t);
    rect(t*5, t*8, t, t);
    rect(t*9, t*10, t, t);

    //ojo
    fill(0);
    ellipse(t*7, t*7, 3, 4);

    popMatrix();
  }
}
class Dragon {
  //atributos
  int x, y;
  int t;
  int v;


  //metodos  
  Dragon(int x_, int y_) {
    x = x_;
    y = y_;
    this.t = 7;
    this.v = 8;
  }

  void mDerecha() {
    this.x+=this.v;
  }

  void mIzquierda() {
    this.x-=this.v;
  }

  void mArriba() {
    this.y-= this.v;
  }

  void mAbajo() {
    this.y+=this.v;
  }

  void movMen() {
    this.x = this.x + 2;
    if (this.x>=800) {
      this.x = -29*t;
    }
  }

  //limites de espacio
  void limitesa() {
    this.x = constrain(this.x, 0, 250-this.t);
    this.y = constrain(this.y, 150, 300-this.t);
  }
  void limitesb() {
    this.x = constrain(this.x, 530, 799-this.t);
    this.y = constrain(this.y, 140, 300-this.t);
  }

  void display() {
    noStroke();
    //cuerpo
    pushMatrix();
    translate(x, y);
    fill(78, 97, 114);

    rect(t*6, t*2, t*2, t);
    rect(t*7, t*3, t*3, t);
    rect(t*8, t*4, t*4, t);
    rect(t*9, t*5, t*4, t);
    rect(t*10, t*6, t*4, t);
    rect(t*11, t*7, t*3, t);
    rect(t*12, t*8, t*3, t);
    rect(t*13, t*9, t*3, t);
    rect(t*15, t*10, t*2, t);
    rect(t*16, t*11, t*2, t);
    //demas
    rect(t*11, t*11, t*3, t*3);
    rect(t*10, t*12, t, t*2);
    rect(t*11, t*14, t, t*3);
    rect(t*12, t*15, t, t*3);
    rect(t*13, t*16, t, t*3);
    rect(t*14, t*17, t, t*3);
    rect(t*14, t*12, t*8, t);
    rect(t*14, t*13, t*7, t);
    rect(t*13, t*14, t*7, t);
    rect(t*14, t*15, t*4, t);
    //cabeza
    rect(t*19, t*10, t*5, t);
    rect(t*20, t*11, t*3, t);
    rect(t*20, t*9, t*7, t);
    rect(t*21, t*8, t*4, t);
    rect(t*22, t*7, t*6, t);
    rect(t*23, t*6, t*5, t);
    //patas
    rect(t*21, t*19, t*2, t);
    rect(t*20, t*17, t, t);
    rect(t*18, t*16, t*2, t);
    rect(t*15, t*20, t*2, t);

    //cuernitos y alas
    fill(217, 168, 143);
    rect(t*22, t*6, t*2, t);
    rect(t*3, t*3, t*4, t);
    rect(t*5, t*4, t*3, t);
    rect(t*6, t*5, t*3, t);
    rect(t*7, t*6, t*3, t);
    rect(t*8, t*7, t*3, t);
    rect(t*8, t*8, t*4, t);
    rect(t*11, t*9, t*2, t);
    rect(t*13, t*10, t*2, t);
    rect(t*14, t*11, t*2, t);
    //pansita
    rect(t*20, t*14, t, t);

    rect(t*10, t*15, t, t);
    rect(t*14, t*16, t*4, t);
    rect(t*18, t*15, t*2, t);

    //sombras
    fill(119, 57, 40);
    rect(t*18, t*11, t*2, t);
    rect(t*17, t*10, t, t);
    rect(t*16, t*9, t, t);
    rect(t*15, t*8, t, t);
    rect(t*14, t*7, t, t);

    //sombrapatas
    rect(t*10, t*14, t, t*3);
    rect(t*11, t*17, t, t);
    rect(t*12, t*18, t, t);
    rect(t*13, t*19, t, t);
    rect(t*14, t*20, t, t);
    rect(t*12, t*14, t, t);
    rect(t*13, t*15, t, t);
    rect(t*15, t*17, t, t);
    rect(t*19, t*17, t, t);
    rect(t*20, t*18, t, t);

    //cola
    fill(78, 97, 114);
    rect(t*3, t*16, t*7, t);
    rect(t*7, t*15, t*3, t);
    rect(t*8, t*14, t*2, t);
    rect(t*9, t*13, t, t);
    //fuego
    fill(255, 43, 0);
    rect(t, t*15, t*2, t);

    //ojo
    fill(0);
    ellipse(t*25, t*7, 3, 4);
    popMatrix();
  }
  void display1() {
    noStroke();
    //cuerpo
    pushMatrix();
    translate(x, y);
    scale(-1, 1);
    fill(78, 97, 114);

    rect(t*6, t*2, t*2, t);
    rect(t*7, t*3, t*3, t);
    rect(t*8, t*4, t*4, t);
    rect(t*9, t*5, t*4, t);
    rect(t*10, t*6, t*4, t);
    rect(t*11, t*7, t*3, t);
    rect(t*12, t*8, t*3, t);
    rect(t*13, t*9, t*3, t);
    rect(t*15, t*10, t*2, t);
    rect(t*16, t*11, t*2, t);
    //demas
    rect(t*11, t*11, t*3, t*3);
    rect(t*10, t*12, t, t*2);
    rect(t*11, t*14, t, t*3);
    rect(t*12, t*15, t, t*3);
    rect(t*13, t*16, t, t*3);
    rect(t*14, t*17, t, t*3);
    rect(t*14, t*12, t*8, t);
    rect(t*14, t*13, t*7, t);
    rect(t*13, t*14, t*7, t);
    rect(t*14, t*15, t*4, t);
    //cabeza
    rect(t*19, t*10, t*5, t);
    rect(t*20, t*11, t*3, t);
    rect(t*20, t*9, t*7, t);
    rect(t*21, t*8, t*4, t);
    rect(t*22, t*7, t*6, t);
    rect(t*23, t*6, t*5, t);
    //patas
    rect(t*21, t*19, t*2, t);
    rect(t*20, t*17, t, t);
    rect(t*18, t*16, t*2, t);
    rect(t*15, t*20, t*2, t);

    //cuernitos y alas
    fill(217, 168, 143);
    rect(t*22, t*6, t*2, t);
    rect(t*3, t*3, t*4, t);
    rect(t*5, t*4, t*3, t);
    rect(t*6, t*5, t*3, t);
    rect(t*7, t*6, t*3, t);
    rect(t*8, t*7, t*3, t);
    rect(t*8, t*8, t*4, t);
    rect(t*11, t*9, t*2, t);
    rect(t*13, t*10, t*2, t);
    rect(t*14, t*11, t*2, t);
    //pansita
    rect(t*20, t*14, t, t);

    rect(t*10, t*15, t, t);
    rect(t*14, t*16, t*4, t);
    rect(t*18, t*15, t*2, t);

    //sombras
    fill(119, 57, 40);
    rect(t*18, t*11, t*2, t);
    rect(t*17, t*10, t, t);
    rect(t*16, t*9, t, t);
    rect(t*15, t*8, t, t);
    rect(t*14, t*7, t, t);

    //sombrapatas
    rect(t*10, t*14, t, t*3);
    rect(t*11, t*17, t, t);
    rect(t*12, t*18, t, t);
    rect(t*13, t*19, t, t);
    rect(t*14, t*20, t, t);
    rect(t*12, t*14, t, t);
    rect(t*13, t*15, t, t);
    rect(t*15, t*17, t, t);
    rect(t*19, t*17, t, t);
    rect(t*20, t*18, t, t);

    //cola
    fill(78, 97, 114);
    rect(t*3, t*16, t*7, t);
    rect(t*7, t*15, t*3, t);
    rect(t*8, t*14, t*2, t);
    rect(t*9, t*13, t, t);
    //fuego
    fill(255, 43, 0);
    rect(t, t*15, t*2, t);

    //ojo
    fill(0);
    ellipse(t*25, t*7, 3, 4);
    popMatrix();
  }
}

class Campo {
  //atributos
  int x, y;
  int t;

  //metodos  
  Campo() {
    this.x = 300;
    this.y = 100;
    this.t = 7;
  }


  //limites de espacio
  void limites() {
    this.x = constrain(this.x, 0, 800-this.t);
    this.y = constrain(this.y, 0, 448-this.t);
  }

  void display() {
    noStroke();



    pushMatrix();
    //sora
    //fill(150,177,208);
    //rect(-t*80,    0,  t*200,    t*60);   
    //pasto
    fill(137, 198, 99);
    noStroke();
    translate(300, 100);
    rect(-t*100, t*18, t*200, t*60);

    fill(129, 189, 92);
    rect(t*58, t*21, t*5, t);
    rect(t*57, t*22, t*7, t);
    rect(t*56, t*23, t*9, t*3);
    rect(t*57, t*26, t*7, t);
    rect(t*58, t*27, t*5, t);

    rect(-t*20, t*27, t*5, t);
    rect(-t*21, t*28, t*7, t);
    rect(-t*22, t*29, t*9, t*3);
    rect(-t*21, t*32, t*7, t);
    rect(-t*20, t*33, t*5, t);

    rect(-t*38, t*17, t*5, t);
    rect(-t*39, t*18, t*7, t);
    rect(-t*40, t*19, t*9, t*3);
    rect(-t*39, t*22, t*7, t);
    rect(-t*38, t*23, t*5, t);

    //CASTILLO
    //paredes
    fill(209, 158, 106);
    rect(t*9, t*3, t*5, t*2);
    rect(t*8, t*6, t*7, t*8);
    rect(t*7, t*15, t*9, t*4);
    rect(t*16, t*7, t*18, t*8);
    rect(t*17, t*16, t*3, t*3);
    rect(t*23, t*16, t*3, t*3);
    rect(t*29, t*16, t*3, t*3);
    rect(t*33, t*15, t*9, t*4);
    rect(t*23, t*16, t*3, t*3);
    rect(t*34, t*6, t*7, t*8);
    rect(t*43, t*16, t, t*3);
    rect(t*44, t*17, t, t*2);
    rect(t*45, t*15, t*5, t*4);
    rect(t*46, t*8, t*3, t*6);
    rect(t*35, t*3, t*5, t*2);


    //torres
    rect(t*9, t*2, t, t);
    rect(t*11, t*2, t, t);
    rect(t*13, t*2, t, t);
    rect(t*35, t*2, t, t);
    rect(t*37, t*2, t, t);
    rect(t*39, t*2, t, t);

    rect(t*8, t*5, t, t);
    rect(t*10, t*5, t, t);
    rect(t*12, t*5, t, t);
    rect(t*14, t*5, t, t);
    rect(t*34, t*5, t, t);
    rect(t*36, t*5, t, t);
    rect(t*38, t*5, t, t);
    rect(t*40, t*5, t, t);

    //BLOQUES MURALLA BAJA
    rect(t*7, t*14, t, t);
    rect(t*9, t*14, t, t);
    rect(t*11, t*14, t, t);
    rect(t*13, t*14, t, t);
    rect(t*15, t*14, t, t);
    rect(t*33, t*14, t, t);
    rect(t*35, t*14, t, t);
    rect(t*37, t*14, t, t);
    rect(t*39, t*14, t, t);
    rect(t*41, t*14, t, t);
    rect(t*45, t*14, t, t);
    rect(t*47, t*14, t, t);
    rect(t*49, t*14, t, t);
    rect(t*17, t*15, t*4, t);
    rect(t*29, t*15, t, t);
    rect(t*31, t*15, t, t);
    rect(t*23, t*15, t, t);
    rect(t*25, t*15, t, t);

    //MURO SUR
    fill(201, 152, 101);
    rect(t*42, t*6, t, t*2);
    rect(t*43, t*7, t, t);
    rect(t*42, t*10, t*3, t*7);
    rect(t*42, t*8, t*3, t*2);

    rect(t*21, t*10, t, t);
    rect(t*22, t*11, t, t);
    rect(t*23, t*12, t, t);
    rect(t*25, t*12, t, t);
    rect(t*26, t*11, t, t);
    rect(t*27, t*10, t, t);

    //TORRE SUR
    fill(209, 158, 106);
    rect(t*46, t*7, t, t);
    rect(t*48, t*7, t, t);
    //TORRE VIGIA
    rect(t*22, t*6, t*5, t*2);
    rect(t*22, t*5, t, t);
    rect(t*24, t*5, t, t);
    rect(t*26, t*5, t, t);
    //TORRE SUPERIOR
    rect(t*17, t*6, t, t);
    rect(t*19, t*6, t, t);
    rect(t*21, t*6, t, t);
    rect(t*27, t*6, t, t);
    rect(t*29, t*6, t, t);
    rect(t*31, t*6, t, t);
    //TORRE ENTRADA
    fill(201, 152, 101);
    rect(t*27, t*14, t, t*5);
    rect(t*21, t*13, t, t*6);

    //sombras claras
    noStroke();
    fill(198, 149, 99);//210,159,107
    rect(t*45, t*9, t, t*5);
    rect(t*41, t*6, t, t*8);
    rect(t*33, t*6, t, t*8);
    rect(t*15, t*6, t, t*8);
    rect(t*16, t*14, t, t*5);
    rect(t*20, t*15, t, t*4);
    rect(t*28, t*16, t, t*3);
    rect(t*32, t*16, t, t*3);
    rect(t*42, t*15, t, t*4);
    rect(t*21, t*6, t, t*4);
    rect(t*27, t*6, t, t*4);
    rect(t*32, t*14, t, t*2);

    //cubitos
    rect(t*9, t*5, t, t);
    rect(t*13, t*5, t, t);
    rect(t*8, t*14, t, t);
    rect(t*10, t*14, t, t);
    rect(t*12, t*14, t, t);
    rect(t*14, t*14, t, t);
    rect(t*18, t*15, t, t);

    rect(t*22, t*15, t, t);
    rect(t*24, t*15, t, t);
    rect(t*26, t*15, t, t);
    rect(t*28, t*15, t, t);
    rect(t*30, t*15, t, t);
    rect(t*32, t*15, t, t);
    rect(t*34, t*14, t, t);
    rect(t*36, t*14, t, t);
    rect(t*38, t*14, t, t);
    rect(t*40, t*14, t, t);
    rect(t*42, t*14, t, t);
    rect(t*43, t*15, t, t);

    rect(t*44, t*16, t, t);
    rect(t*35, t*5, t, t);
    rect(t*39, t*5, t, t);
    rect(t*22, t*16, t, t*3);
    rect(t*26, t*16, t, t*3);
    rect(t*22, t*10, t, t);
    rect(t*23, t*11, t, t);
    rect(t*24, t*12, t, t);
    rect(t*25, t*11, t, t);
    rect(t*26, t*10, t, t);
    rect(t*46, t*14, t, t);
    rect(t*48, t*14, t, t);
    rect(t*44, t*14, t, t*2);

    //ventanas sombra
    fill(140);
    noStroke();
    rect(t*11, t*4, t, t*2);
    rect(t*10, t*8, t, t);
    rect(t*12, t*11, t, t);
    rect(t*24, t*8, t, t);
    rect(t*24, t*17, t, t*2);
    rect(t*37, t*4, t, t*2);
    rect(t*38, t*8, t, t);
    rect(t*36, t*11, t, t);
    rect(t*47, t*9, t, t);

    rect(t*8, t*19, t*42, t*2);
    rect(t*9, t*21, t*6, t*3);
    rect(t*23, t*21, t*5, t);
    rect(t*35, t*21, t*7, t);
    rect(t*36, t*22, t*5, t*2);
    rect(t*46, t*21, t*4, t);

    rect(t*59, t*28, t*4, t);
    rect(t*60, t*29, t*2, t);

    rect(-t*19, t*34, t*4, t);
    rect(-t*18, t*35, t*2, t);

    rect(-t*37, t*24, t*4, t);
    rect(-t*36, t*25, t*2, t);

    popMatrix();
  }
}

class Nuve {
  //atributos
  int x, y;
  int t;
  int v;
  float dt;
  //metodos
  Nuve(int x_, int y_) {
    x = x_;
    y = y_;
    this.t = 7;
    this.v = 5;
  }
  void display() {
    noStroke();
    //NUVE
    pushMatrix();
    fill(150, 177, 208);
    rect(-t*80, 0, t*200, t*60);  
    dt+=0.01;
    for (int i= 0; i<800; i+=3) {
      for (int j = 0; j<230; j+=3) {
        fill(noise(i*0.01+dt, j*0.03, dt)*255, noise(i*0.01+dt*1, j*0.05+1, dt)*6);
        rect(i, j, 10, 10);
      }//137,198,99
    }
    popMatrix();
  }
}

class Caballero {
  //atributos
  int x, y;
  int t;
  int v;


  //metodos  
  Caballero(int x_, int y_) {
    x = x_;
    y = y_;

    this.t = 7;
    this.v = 8;
  }

  void mDerecha() {
    this.x+=this.v;
  }

  void mIzquierda() {
    this.x-=this.v;
  }

  void mArriba() {
    this.y-= this.v;
  }

  void mAbajo() {
    this.y+=this.v;
  }
  void movMen() {
    this.x = this.x + 2;
    if (this.x>=800) {
      this.x = -29*t;
    }
  }
  //limites de espacio
  void limitesa() {
    this.x = constrain(this.x, 0, 400-this.t);
    this.y = constrain(this.y, 150, 345-this.t);
  }
  void limitesb() {
    this.x = constrain(this.x, 460, 799-this.t);
    this.y = constrain(this.y, 140, 345-this.t);
  }

  void display() {
    noStroke();
    //cuerpo
    fill(122);
    pushMatrix();
    translate(x, y);
    rect(t*7, 0, t*2, t);
    rect(t*6, t, t*4, t);
    rect(t*5, t*2, t*3, t);
    rect(t*6, t*5, t*4, t);
    rect(t*7, t*7, t*3, t*3);

    //regilla
    fill(160);
    noStroke();
    rect(t*10, t, t*2, t*3);
    rect(t*8, t*2, t*2, t*2);
    rect(t*7, t*3, t, t);
    rect(t*5, t*6, t*5, t);

    //rueda, hombreras
    fill(135);
    noStroke();
    rect(t*5, t*3, t*2, t*2);
    rect(t*6, t*7, t, t);
    rect(t*10, t*7, t, t);

    //rejilla, piernas
    fill(155);
    noStroke();
    rect(t*7, t*4, t*4, t);
    rect(t*7, t*10, t, t*2);
    rect(t*9, t*10, t, t*2);

    //espada
    fill(149, 161, 195);
    noStroke(); 
    rect(t*10, t*8, t, t);
    rect(t*11, t*6, t*2, t);
    rect(t*12, t*7, t, t);
    rect(t*13, t*5, t, t);
    rect(t*14, t*4, t, t);
    rect(t*15, t*3, t, t);

    //zapatos
    fill(145, 134, 126);
    noStroke();
    rect(t*9, t*12, t*2, t);
    rect(t*7, t*12, t, t);

    //mano
    fill(240, 211, 165);
    noStroke();
    rect(t*11, t*7, t, t);
    rect(t*6, t*8, t, t);

    //pluma
    fill(173, 133, 186);
    noStroke();
    rect(t*6, -t*2, t, t*2);
    rect(t*5, -t*3, t, t*2);
    rect(t*4, -t*3, t, t);
    popMatrix();
  }
  void display1() {
    noStroke();
    //cuerpo
    fill(122);
    pushMatrix();
    translate(x, y);
    scale(-1, 1);
    rect(t*7, 0, t*2, t);
    rect(t*6, t, t*4, t);
    rect(t*5, t*2, t*3, t);
    rect(t*6, t*5, t*4, t);
    rect(t*7, t*7, t*3, t*3);

    //regilla
    fill(160);
    noStroke();
    rect(t*10, t, t*2, t*3);
    rect(t*8, t*2, t*2, t*2);
    rect(t*7, t*3, t, t);
    rect(t*5, t*6, t*5, t);

    //rueda, hombreras
    fill(135);
    noStroke();
    rect(t*5, t*3, t*2, t*2);
    rect(t*6, t*7, t, t);
    rect(t*10, t*7, t, t);

    //rejilla, piernas
    fill(155);
    noStroke();
    rect(t*7, t*4, t*4, t);
    rect(t*7, t*10, t, t*2);
    rect(t*9, t*10, t, t*2);

    //espada
    fill(149, 161, 195);
    noStroke(); 
    rect(t*10, t*8, t, t);
    rect(t*11, t*6, t*2, t);
    rect(t*12, t*7, t, t);
    rect(t*13, t*5, t, t);
    rect(t*14, t*4, t, t);
    rect(t*15, t*3, t, t);

    //zapatos
    fill(145, 134, 126);
    noStroke();
    rect(t*9, t*12, t*2, t);
    rect(t*7, t*12, t, t);

    //mano
    fill(240, 211, 165);
    noStroke();
    rect(t*11, t*7, t, t);
    rect(t*6, t*8, t, t);

    //pluma
    fill(173, 133, 186);
    noStroke();
    rect(t*6, -t*2, t, t*2);
    rect(t*5, -t*3, t, t*2);
    rect(t*4, -t*3, t, t);
    popMatrix();
  }
}



class Avatar {
  //atributos
  int x, y;
  int t;
  int v;
  color c;

  //metodos  
  Avatar(int x_, int y_) {
    x = x_;
    y = y_;

    this.t = 7;
    this.c = color(78, 87, 114);
    this.v = 8;
  }

  void mDerecha() {
    this.x+=this.v;
  }

  void mIzquierda() {
    this.x-=this.v;
  }

  void mArriba() {
    this.y-= this.v;
  }

  void mAbajo() {
    this.y+=this.v;
  }

  void movMen() {
    this.x = this.x + 2;
    if (this.x>=800) {
      this.x = -29*t;
    }
  }

  //limites de espacio
  void limitesa() {
    this.x = constrain(this.x, 0, 340-this.t);
    this.y = constrain(this.y, 150, 335-this.t);
  }
  void limitesb() {
    this.x = constrain(this.x, 460, 799-this.t);
    this.y = constrain(this.y, 140, 335-this.t);
  }
  void display() {

    noStroke();
    //trapo

    pushMatrix();
    translate(x, y);
    //BASTON
    noStroke();
    fill(73, 56, 41);
    rect(t*7, t*10, t, t*6);
    rect(t*5, t*10, t*2, t);
    rect(t*5, t*11, t, t);

    fill(this.c);
    rect(t*3, t*2, t*3, t);
    rect(t*2, t*3, t*3, t*3);
    rect(t*3, t*6, t*2, t);
    rect(t*4, t*7, t, t);
    rect(t*5, t*8, t, t);

    //cobija
    fill(64, 79, 36);
    noStroke();
    rect(t*2, t*7, t*2, t);
    rect(t, t*8, t*4, t);
    rect(t, t*9, t*5, t);
    rect(t, t*10, t*4, t*2);
    rect(t, t*12, t*3, t);
    rect(t, t*13, t*2, t);


    //cara,mano
    fill(240, 211, 165);
    rect(t*5, t*7, t*2, t);
    rect(t*6, t*6, t*2, t);
    rect(t*6, t*10, t, t);

    //cabello
    fill(214, 214, 214);
    rect(t*5, t*3, t*2, t*3);
    rect(t*7, t*4, t, t);
    rect(t*5, t*6, t, t);

    //vestido
    fill(176, 102, 06);
    rect(t*4, t*12, t, t*3);
    rect(t*3, t*13, t, t*2);
    rect(t*2, t*13, t, t*2);
    rect(t*5, t*10, t, t);


    //zapatos
    fill(40);
    rect(t*2, t*15, t*2, t);
    //ojo
    fill(0);
    ellipse(t*7, t*6, 3, 4);

    popMatrix();
  }
  void display1() {

    noStroke();
    //trapo
    //BASTON
    noStroke();

    fill(73, 56, 41);
    pushMatrix();
    translate(x, y);
    scale(-1, 1);
    rect(t*7, t*10, t, t*6);
    rect(t*5, t*10, t*2, t);
    rect(t*5, t*11, t, t);

    fill(this.c);
    rect(t*3, t*2, t*3, t);
    rect(t*2, t*3, t*3, t*3);
    rect(t*3, t*6, t*2, t);
    rect(t*4, t*7, t, t);
    rect(t*5, t*8, t, t);

    //cobija
    fill(64, 79, 36);
    noStroke();
    rect(t*2, t*7, t*2, t);
    rect(t, t*8, t*4, t);
    rect(t, t*9, t*5, t);
    rect(t, t*10, t*4, t*2);
    rect(t, t*12, t*3, t);
    rect(t, t*13, t*2, t);


    //cara,mano
    fill(240, 211, 165);
    rect(t*5, t*7, t*2, t);
    rect(t*6, t*6, t*2, t);
    rect(t*6, t*10, t, t);

    //cabello
    fill(214, 214, 214);
    rect(t*5, t*3, t*2, t*3);
    rect(t*7, t*4, t, t);
    rect(t*5, t*6, t, t);

    //vestido
    fill(176, 102, 06);
    rect(t*4, t*12, t, t*3);
    rect(t*3, t*13, t, t*2);
    rect(t*2, t*13, t, t*2);
    rect(t*5, t*10, t, t);


    //zapatos
    fill(40);
    rect(t*2, t*15, t*2, t);
    //ojo
    fill(0);
    ellipse(t*7, t*6, 3, 4);

    popMatrix();
  }
}

//-------------------- Personaje seleccion--------------

Avatar     personaje1;
Caballero  cab1;
Dragon     drag1;
Merlin     mago1;
Paloma     cucu1;
// -------------------Personjes Menu---------------------

Avatar     personaje2;
Caballero  cab2;
Dragon     drag2;
Merlin     mago2;
Palo       palo2;

//-------------------PERSONAJE GANADOR------------------

Avatar     personaje3;
Caballero  cab3;
Dragon     drag3;
Merlin     mago3;
Palo       palo3;


Campo batalla;
Nuve bb;
Game       ayuda;

//----------------------JUGADORES--------------------

Avatar     personaje_pl1;
Caballero  cab_pl1;
Dragon     drag_pl1;
Merlin     mago_pl1;
Paloma     cucu_pl1;


Avatar     personaje_pl2;
Caballero  cab_pl2;
Dragon     drag_pl2;
Merlin     mago_pl2;
Paloma     cucu_pl2;


//-------------------- SETUP-----------------------------------
void setup() {
  size(800, 600);

  titulo      = loadFont("PressStart2P-Regular-48.vlw");
  selec       = loadFont("PressStart2P-Regular-48.vlw");

  music       = new Minim(this);
  music_1     = music.loadFile("menu.mp3");
  music_1.setGain(-10);
  music_1.loop();
  
  music       = new Minim(this);
  music_2     = music.loadFile("seleccion.mp3");
  music_2.setGain(-10);
  music_2.loop();
  
  music       = new Minim(this);
  music_3     = music.loadFile("batalla.mp3");
  music_3.setGain(-10);
  music_3.loop();

  //-------------SELECCION DE PERSONAJES------------------

  personaje1  = new Avatar(120, 170);
  cab1        = new Caballero(320, 190);
  mago1       = new Merlin(590, 160);
  drag1       = new Dragon(160, 330);
  cucu1       = new Paloma(475, 370);

  batalla     = new Campo();
  bb          = new Nuve(300, 100);
  ayuda       = new Game(10, 415);
  //menu

  personaje2  = new Avatar(600, 90);
  cab2        = new Caballero(120, 100);
  mago2       = new Merlin(275, 80);
  drag2       = new Dragon(380, 30);
  palo2       = new Palo(30, 50);

  //---------------GANADORES---------------------

  personaje3  = new Avatar(600, 90);
  cab3        = new Caballero(120, 100);
  mago3       = new Merlin(275, 80);
  drag3       = new Dragon(380, 30);
  palo3       = new Palo(30, 50);

  //--------------POSICION DE JUGADORES----------------

  personaje_pl1 = new Avatar(120, 330);
  cab_pl1       = new Caballero(120, 330);
  drag_pl1      = new Dragon(120, 330); 
  mago_pl1      = new Merlin(120, 330);
  cucu_pl1      = new Paloma(120, 330);


  personaje_pl2 = new Avatar(670, 330);  
  cab_pl2       = new Caballero(670, 330);
  drag_pl2      = new Dragon(670, 330);
  mago_pl2      = new Merlin(670, 330);
  cucu_pl2      = new Paloma(670, 330);
}


void draw() {
  background(0);
  switch(pantalla) {

  case 0:
  
  music_2.pause();
  music_3.pause();

    pushMatrix();
    cab2.display();
    cab2.movMen();
    personaje2.display();
    personaje2.movMen();
    mago2.display();
    mago2.movMen();
    drag2.display();
    drag2.movMen();
    palo2.display();
    palo2.movMen();

    textSize(18);
    fill(255);
    textFont(titulo);
    text("Merlin's Chaos!", 70, 340);
    fill(random(255), random(255), random(255));
    textSize(12);
    text("Press 'S' to continue", 280, 400);
    if (keyPressed) {
      switch(key) {
      case 's': 
        pantalla=1;
       music_2.loop();
        break;
      case 'S': 
        pantalla=1;
      }
    }
    if (vida1 <= 0 || vida2 <= 0) {
      vida1=100; 
      vida2=100;
      music_1.loop();
    } 

    popMatrix();
    break;

  case 1:
  music_1.pause();
  music_3.pause();

    selec();

    personaje_pl1 = new Avatar(120, 330);
    cab_pl1       = new Caballero(120, 330);
    drag_pl1      = new Dragon(120, 330); 
    mago_pl1      = new Merlin(120, 330);
    cucu_pl1      = new Paloma(120, 330);


    personaje_pl2 = new Avatar(670, 330);  
    cab_pl2       = new Caballero(670, 330);
    drag_pl2      = new Dragon(670, 330);
    mago_pl2      = new Merlin(670, 330);
    cucu_pl2      = new Paloma(670, 330);
    break;


  case 2:
   
    pelea();
    ayuda.display();
    music_1.pause();
    music_2.pause();

    keyPressed();
    switch(key) {
    case 'q':

      if ((key=='q'|| key=='Q' )&&turno == 1) {
        vida2 -=5;
        turno =2;
      }
      break;
    case 'e':

      if ((key=='e' || key=='E')&&turno == 1) {
        vida2 -=10;
        turno =2;
      }
      break;
    }
    switch(keyCode) {
    case 16:

      if ((keyCode == 16)&&turno == 2) {
        vida1 -=5;
        turno =1;
      }
      break;
    case 17:

      if ((keyCode == 17)&&turno == 2) {
        vida1 -=10;
        turno =1;
      }
      break;
    }

    if (vida1 <= 0 || vida2 <= 0) {
      pantalla = 3;
     music_2.loop();
    }

    pushMatrix();
    if (keyPressed) {
      switch(key) {
      case 'a':
        if ((key=='a'|| key=='A' )) {
          personaje_pl1.mIzquierda();
          drag_pl1.mIzquierda();
          cab_pl1.mIzquierda();
          mago_pl1.mIzquierda();
          cucu_pl1.mIzquierda();
          break;
        }
      case 'w':
        if ((key=='w'|| key=='W' )) {

          personaje_pl1.mArriba();
          drag_pl1.mArriba();
          cab_pl1.mArriba();
          mago_pl1.mArriba();
          cucu_pl1.mArriba();

          break;
        }
      case 's':
        if ((key=='s'|| key=='S' )) {
          personaje_pl1.mAbajo();
          drag_pl1.mAbajo();
          cab_pl1.mAbajo();
          mago_pl1.mAbajo();
          cucu_pl1.mAbajo();
          break;
        }
      case 'd':
        if ((key=='d'|| key=='D' )) {
          personaje_pl1.mDerecha();
          drag_pl1.mDerecha();
          cab_pl1.mDerecha();
          mago_pl1.mDerecha();
          cucu_pl1.mDerecha();
          break;
        }
      }
    }
    if (keyPressed) {
      switch(keyCode) {
      case 37:
        personaje_pl2.mIzquierda();
        drag_pl2.mIzquierda();
        cab_pl2.mIzquierda();
        mago_pl2.mIzquierda();
        cucu_pl2.mIzquierda();
        break;
      case 38:
        personaje_pl2.mArriba();
        cab_pl2.mArriba();
        drag_pl2.mArriba();
        mago_pl2.mArriba();
        cucu_pl2.mArriba();
        break;
      case 40:
        personaje_pl2.mAbajo();
        drag_pl2.mAbajo();
        cab_pl2.mAbajo();
        mago_pl2.mAbajo();
        cucu_pl2.mAbajo();
        break;
      case 39:
        personaje_pl2.mDerecha();
        drag_pl2.mDerecha();
        cab_pl2.mDerecha();
        mago_pl2.mDerecha();
        cucu_pl1.mDerecha();
        break;
      }
    }
    popMatrix();


    break;


  case 3:
   
    win();
    music_1.pause();
    music_3.pause();
   

    break;
  }
}


void selec() {
  textSize(25);
  fill(255);
  noStroke();
  text("Chose your player!", 170, 100);
  textFont(selec);
  fill(255);
  textSize(12);
  text("EDA", 130, 300);
  text("JAN", 360, 300);
  text("MERLIN", 600, 300);
  text("DAVOS", 255, 495);
  text("CUCU", 500, 495);

  textSize(10);
  text("Press the letter of the character you prefer!", 170, 550);
  text("Player One singles first", 270, 570);

  fill(90, 160, 141);
  textSize(14);
  text('Q', 140, 317);//eda
  text('W', 372, 317);//jan
  text('E', 630, 317);//merlin
  text('R', 277, 515);//davos
  text('T', 520, 515);//cucu

  personaje1.display();
  cab1.display();
  mago1.display();
  drag1.display();
  cucu1.display();


  keyPressed();
  pushMatrix();

  if ((key=='q' || key =='Q')&&(turno==0)) {
    player1 =1;
    turno =1;
  } else {
    if ((key=='q' || key =='Q')&&(turno==1)&& player1!=1) {
      player2 =1;
      pantalla=2;
       music_3.loop();
     
    }
  }
  if ((key=='w' || key =='W')&&(turno==0)) {
    player1 =2;
    turno =1;
  } else {
    if ((key=='w' || key =='W')&&(turno==1)&& player1!=2) {
      player2 =2;
      pantalla=2;
       music_3.loop();
      
    }
  }
  if ((key=='e' || key =='E')&&(turno==0)) {
    player1 =3;
    turno =1;
  } else {
    if ((key=='e' || key =='E')&&(turno==1)&& player1!=3) {
      player2 =3;
      pantalla=2;
       music_3.loop();
    }
  }
  if ((key=='r' || key =='R')&&(turno==0)) {
    player1 =4;
    turno =1;
  } else {
    if ((key=='r' || key =='R')&&(turno==1)&& player1!=4) {
      player2 =4;
      pantalla=2;
      music_3.loop();
    }
  }
  if ((key=='t' || key =='T')&&(turno==0)) {
    player1 =5;
    turno =1;
  } else {
    if ((key=='t' || key =='T')&&(turno==1)&& player1!=5) {
      player2 =5;
      pantalla=2;
      music_3.loop();
    }
  }
  
  
  popMatrix();
}


void pelea() {

  bb.display();
  batalla.display();
  

  fill(0);
  rect(90, 75, 120, 20);//sombra
  rect(600, 75, 120, 20);

  fill(90, 160, 141);//vida
  rect(610, 80, vida2*1, 10);
  rect(100, 80, vida1*1, 10);

  fill(255);
  textFont(titulo);
  textSize(11);
  text("Player1", 85, 70);
  text("Player2", 650, 70);

  //-------------------JUGADOR1------------------
  if (player1 == 1) {
    personaje_pl1.display();
    personaje_pl1.limitesa();
  }
  if (player1 == 2) {
    cab_pl1.display();
    cab_pl1.limitesa();
  }
  if (player1 == 3) {
    mago_pl1.display();
    mago_pl1.limitesa();
  }
  if (player1 == 4) {
    drag_pl1.display();
    drag_pl1.limitesa();
  }
  if (player1 == 5) {
    cucu_pl1.display();
    cucu_pl1.limitesa();
  }


  //-------------------JUGADOR2----------------
  if (player2 == 1) {
    personaje_pl2.display1();
    personaje_pl2.limitesb();
  }
  if (player2 == 2) {
    cab_pl2.display1();
    cab_pl2.limitesb();
  }
  if (player2 == 3) {
    mago_pl2.display1();
    mago_pl2.limitesb();
  }
  if (player2 == 4) {
    drag_pl2.display1();
    drag_pl2.limitesb();
  }
  if (player2 == 5) {
    cucu_pl2.display1();
    cucu_pl2.limitesb();
  }
}

void win() {
 
  if (vida1<=0) {
    textFont(selec);
    textSize(30);
    fill(255);
    text("PLAYER 2", 290, 235);
    if (player2 == 1) {
      personaje3.display();
      personaje3.movMen();
    }
    if (player2 == 2) {
      cab3.display();
      cab3.movMen();
    }
    if (player2 == 3) {
      mago3.display();
      mago3.movMen();
    }
    if (player2 == 4) {
      drag3.display();
      drag3.movMen();
    }
    if (player2 == 5) {
      palo3.display();
      palo3.movMen();
    }
  } else if (vida2<=0) {
    textSize(30);
    fill(255);
    text("PLAYER 1", 290, 235);
    if (player1 == 1) {
      personaje3.display();
      personaje3.movMen();
    }
    if (player1 == 2) {
      cab3.display();
      cab3.movMen();
    }
    if (player1 == 3) {
      mago3.display();
      mago3.movMen();
    }
    if (player1 == 4) {
      drag3.display();
      drag3.movMen();
    }
    if (player1 == 5) {
      palo3.display();
      palo3.movMen();
    }
  }
  textFont(selec);
  textSize(40);
  fill(random(0, 255));
  text("You Win!", 250, 355);

  fill(255);
  textSize(15);
  text("press 'SPACE' to back to menu", 190, 500);
  if (keyCode == 32) {
    music_1.loop();
    pantalla=0;
    turno=0;
    
  }
}
