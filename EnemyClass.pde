class Bats
{
  PVector Pos = new PVector(0, 0);
  int speed = -6;

  Bats(float y, int num)
  {
    this.Pos.x = 2000*num; //give the bat a starting x position
    this.Pos.y = y -50; // gives the bat a starting y position based on the players y position
  }

  void update()
  {
    //updates the bat's position
    Pos.x += speed;
  }

  void display()
  {
    if (millis() > batTime + 150) //uses millis to animate the bat
    {
       batIndex++;
      batTime = millis();
     
      if (batIndex == 7)
      {
        batIndex = 0;
      }
      
    } 
    image(bat[batIndex], Pos.x, Pos.y, 80, 80);
  }
}
