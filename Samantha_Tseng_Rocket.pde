//initialise score variable
int score;
int ballSize = 20;
  boolean fire = false;
  
  //Initialise gameOver variable
 int gameOver = 0;
 
 //int startGame;
  int getRandomX()
  
  
 // int score;
  {
    return int(random(600));
  }
  
  int[] ballx = { getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX() };
  int[] bally = { 0, 0, 0, 0, 0 };
  
  void setup()
  {
    
    //Size 
    size (900, 500);
    smooth ();
    
  }
  
  void draw()
  {


   //Game Style
   
   background (0);
    fill(255);
    stroke (255);
     triangle(mouseX, 430, mouseX+5, 460, mouseX-5, 460); //top of rocket
     fill(209, 6, 6);
     triangle(mouseX-5, 460, mouseX-5, 480, mouseX-10, 480); //left wing
     triangle(mouseX+5, 460, mouseX+5, 480, mouseX+10, 480); //right fin
     triangle(mouseX-5, 480, mouseX+5, 480, mouseX, 500); //stray part
    ellipse(mouseX, 465, 3, 3);
     ellipse(mouseX, 475, 3, 3);
     triangle(mouseX+10, 480, mouseX-10, 480, mouseX-25, 500); //left of flame
     triangle(mouseX+10, 480, mouseX-10, 480, mouseX+25, 500); //right of flame
    // display score
    fill(255);
    text(score, 20,20);
    if(fire)
    {
      cannon(mouseX);
      fire = false;
    }
  
     ballFalling();
     gameFinish();  
  }
 
  //Play the game
  
 
  void mousePressed()
  {
    fire = true;
  }
  
  void ballFalling()
  {  
    stroke(39, 154, 240); 
    fill (39, 154, 240); 
    
    for (int i=0; i<5; i++)
    {
      ellipse(ballx[i], bally[i]++, ballSize, ballSize);
    }
  }
  
  void cannon(int shotX)
  {
    boolean strike = false;
    for (int i = 0; i < 5; i++)
    {
      if((shotX >= (ballx[i]-ballSize/2)) && (shotX <= (ballx[i]+ballSize/2))) {
        strike = true;
        line(mouseX, 500, mouseX, bally[i]);
        ellipse(ballx[i], bally[i],
                ballSize+25, ballSize+25);
        ballx[i] = getRandomX();
        bally[i] = 0;




// update score
        score++;
      }    
    }
  
    if(strike == false)
    {
      line(mouseX, 500, mouseX, 0);
    }  
  
  }
  
  
  //GameOver
  
  void gameFinish()
  {
    for (int i=0; i< 5; i++)
    {
      if(bally[i]==530)
      {


    
        fill(color(255,0,0));
     fill(255, 0, 0);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    text("Well done! Your score was : "+ score, width/2, height/2 + 50);
      
     noLoop();


  
       }
      }
    }