void GameOverCheck()
{
  if (p.Pos.y >= 900) { //if the player falls the game ends
    high[5]=current;
    high = bubbleSort(high);
    state = 3;
    rect(0, 0, width, height);
  }
  
  if(darkness >= 230) // if the farkness reaches 230 then the game ends
  {
    high[5] = current;
    high = bubbleSort(high);
    state = 3;
  }
}

void GameOverScreen()
{
  // game over screen that shoes score and instructions on what to do next
  saveHighScore();
  textMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
  background(0);
  fill(255);
  textSize(50);
  image(fire[10], width/2, height/4);
  
  image(fire[11], width/2, height/2);
  textSize(40);
  text( current, width/2, height/2 + 75);
  
  image(fire[12], width/2, 3*height/4);
  image(fire[13], width/2, 3*height/4 + 50);
}
