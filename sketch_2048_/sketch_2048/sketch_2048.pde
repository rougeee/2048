PImage victoire;
int colonnes = 6;
int rangees = 6;
int[][] tab;
int x = int(random(0,5));
int y = int(random(0,5));
boolean right, left, up, down, space;
int largeurColonne, hauteurRangee;
boolean aleatoire = true;
boolean pop = true;
PFont Font1;
int rand;
int score;

void deplacement(int x, int y, int pas1, int pas2) {
            for(int k = 225; k > 15; k = k - 30){
            if (tab[x][y] == k){
              if(tab[x+pas1][y+pas2] == k){
               tab[x+pas1][y+pas2] -= 30;
               tab[x][y] = 255;
               score += 1;
              } else if(tab[x+pas1][y+pas2] == 255){
                tab[x+pas1][y+pas2] = tab[x][y];
                tab[x][y] = 255;
              }
            }
          }

}



void aleatoire(){
        rand = int (random(5,10));
          for (int k = 0 ; k < rand ; k++) {
            int numeroR = int (random(0,5));
            int numeroC = int (random(0,5));
            tab[numeroC][numeroR] -= 30;
          }
}


void setup () {
  victoire = loadImage("victoire.jpg");
  Font1 = createFont("ArialMT", 15);
  
  size(800,800);
  tab = new int[colonnes][rangees];
  for(int i=0 ; i < colonnes ; i++){
      for(int j=0; j<rangees ; j++){
        tab[i][j]=255;
      }
  }
  aleatoire();
  
  
  right = left = down = up = false;
  largeurColonne = width/colonnes;
  hauteurRangee = height/rangees;

}


void draw () {
  
  if(get((int)(mouseX),(int)(mouseY)) == #FF0000){
    println("0");
    for(int i=0 ; i < colonnes ; i++){
      for(int j=0; j<rangees ; j++){
        tab[i][j]=255;
      }
    }
      aleatoire();
      space = true;
      score = 0;
    }
  

          
        
  //dld : Déplacement Ligne -> Droite
  //dlg : Déplacement Ligne -> Gauche
  //dch : Déplacement Colonne -> Haut
  //dcb : Déplacement Colonne -> Bas
  //tc : Toutes les colonnes
  //tl : Toutes les lignes
  
  if(get((int)(mouseX),(int)(mouseY)) == #00ff00){
    
    
    
    if(right){
      println("right");
      for(int tl=0; tl < 5; tl++){
        for(int dcd=3; dcd > -1; dcd--){
          deplacement(dcd, tl, 1, 0);
        }
      }
    }

    if(left){
      println("left");
      for(int tl=0; tl < 5; tl++){
        for(int dcg=1; dcg < 5; dcg++){
          deplacement(dcg, tl, -1, 0);
        }
      }
    }
        
    if(up){
      println("up");
      for(int dlh=0; dlh < 5; dlh++){
        for(int tc=1; tc < 5; tc++){
          deplacement(dlh, tc, 0, -1);
        }
      }
    }

                
    if(down){
      println("down");
      for(int dlb=0; dlb < 5; dlb++){
        for(int tc=3; tc > -1; tc--){
          deplacement(dlb, tc, 0, 1);
        }
      }
    }

  
    if(pop == false){
         int a = int(random(0,5));
            int b = int(random(0,5));
          if(tab[a][b]== 255){
           int alea1 = int(random(10));
             if(alea1 != 1){
                tab [a][b] = 225;}
             if(alea1 == 1){
                tab [a][b] = 195; }
            }
         pop = true;
    }
  }
  /*for(int i=0 ; i < colonnes ; i++){
    for(int j=0; j < rangees ; j++){
      if (tab[i][j] == 0){
        fill(255,127,80);
        rect(0,0,800,800);
      }
    }
  }
  */    

  background(#445566);
  
  for(int i=0 ; i < colonnes ; i++){
      for(int j=0; j < rangees ; j++){
        fill(tab[i][j]);
        int xRect = i*largeurColonne;
        int yRect = j*hauteurRangee;
        rect( xRect+1,yRect+1,largeurColonne-5,hauteurRangee-5);
        fill(178,34,34);
        textFont(Font1);
        text (tab[i][j]-15, (xRect+largeurColonne/2)-7,(yRect+largeurColonne/2));
      
  
      }
  }
  
   noStroke();
  fill(255,127,80);
  rect(666,0,140,800);
  rect(0,666,800,138);
  fill(255,0,0);
  rect(710,173,50,50);
  fill(0,255,0);
  rect(710, 433,50,50);
  

   textSize(18);
        fill(0);
        text("Fusionne les cases de même valeur en utilisant les flèches pour les déplacer.",10,703);
        text("Fusionne les cases de même valeur en utilisant les flèches pour les déplacer.",11,703);
        text("Essayes d'arriver à 0 en faisant le moins de fusions possible !",10,733);
        text("Essayes d'arriver à 0 en faisant le moins de fusions possible !",11,733);
        text("Réinitialise ta ",680,83);
        text("Réinitialise ta ",681,83);
        text("partie en ",700,113);
        text("partie en ",701,113);
        text("venant ici :",692,143);
        text("venant ici :",693,143);
        text("|",734,165);
        text("|",735,165);
        text("|",736,165);
        text("V",731,169);
        text("V",732,169);
        text("Pour jouer", 690,373);
        text("Pour jouer", 691,373);
        text("vient ici :", 698 , 403);
        text("vient ici :", 699 , 403);
        text("|",734,425);
        text("|",735,425);
        text("|",736,425);
        text("V",731,429);
        text("V",732,429);
        text("Reste dans la", 680, 510);
        text("Reste dans la", 681, 510);
        text("zone verte.", 694, 540);
        text("zone verte.", 695, 540);
        fill(0,0,255);
        text("Nombre de fusions = "+score, 10, 763); 
        text("Nombre de fusions = "+score, 11, 763);
        
        
    for(int i=0 ; i < colonnes ; i++){
      for(int j=0; j<rangees ; j++){
        if( tab[i][j] == 15){
          fill(#FF0000);
          rect(0,0,800,800);
          image(victoire, 0, 100);
          fill(0);
          text("Ton nombre de fusions est de "+score, 80, 183); 
          text("Ton nombre de fusions est de "+score, 81, 183);
        }
      }
  }
  
      
}

void keyPressed() {
   
    if(keyCode == RIGHT) right=true;
    if(keyCode == LEFT) left=true;;
    if(keyCode == UP) up=true;
    if(keyCode == DOWN) down=true;
     }
    


void keyReleased() {
    pop = false;
    if (keyCode == RIGHT) { right = false; }
    if (keyCode == LEFT ) { left = false;  }
    if (keyCode == UP)    { up = false;    }
    if (keyCode == DOWN)  { down = false;  }
     if (key == ' ')  { space = true;  }
   
}
