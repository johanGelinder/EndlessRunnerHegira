void muteClick() {

  if ( mouseX > 1205 && mouseY > 650 && mouseX < 1255 && mouseY < 700) {
    mute = !mute; //mutes the game
    menuMusic.pause();
  }
}
