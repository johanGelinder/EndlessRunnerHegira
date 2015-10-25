void highscoreMenu() {
  
  if ( mouseX > 505 & mouseY > 600 && mouseX < 770 && mouseY < 650) {
    start = false; // stop displaying the title screen
    highScore = true; // if the highscore button is clicked on start displaying the highscore menu
  }
  
  if ( mouseX > 575 && mouseY > 680 && mouseX < 705 && mouseY < 725) { //  // back button clic
    start = true; // make start true to go back to the title screen
    highScore = false; // stop displaying the highscore menu
  }
}
