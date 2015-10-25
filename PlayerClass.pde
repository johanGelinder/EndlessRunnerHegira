
class player
{

  PVector Pos = new PVector(0, 0);
  PVector Vel = new PVector(0, 0);

  int counter = 0;
  int time = 0;

  player(int X, int Y, int SX, int SY) 
  {
    // inputs the position and speed values of the player
    this.Pos.x = X;
    this.Pos.y = Y;
    this.Vel.x = SX;
    this.Vel.y = SY;
  }

  void update()
  {
    //updates the position vaules of the player
    Pos.x += Vel.x;
    Pos.y += Vel.y;

    //updates the speed vaules of the player
    if (Vel.y ==0) //the player only speeds up while he is on the platform because when they are on the platform the y speed will be 0 
    {
      Vel.x += 0.01;
    }
    Vel.y += 0.25;
  }

  void animate()
  {
    if (millis() > time + 115) { // uses millis to animate the player
      playerIndex ++;
      jumpIndex ++;
      fireTrap ++;
      time = millis();

      if ( playerIndex > 7) {
        playerIndex = 0; //used if player is on the ground
      }
      if ( jumpIndex > 13) {
        jumpIndex = 0; //used if player is jumping
      }
    }
  }

  void display() 
  {
    animate();
    // checks if the character is running or jumping and then use the appropriate sprite set
    if (run) {

      image(imgPlayer[playerIndex], Pos.x, Pos.y-122, 100, 150);
    }
    if (!run) {

      image(imgJump[jumpIndex], Pos.x, Pos.y-122, 100, 150);
    }
  }

  void jump()
  {
    if (Vel.y == 0) // if the caracter is on the plater form then he can jump
    {
      Vel.y = -10;
      run = false; // while jumping the chracter is nolonger running so run becomes false
    }
  }
}
