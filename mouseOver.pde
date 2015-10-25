void mouseOver() { // menu

  // when you hover over width the mouse a rectangle is draw over it to mark which one you are choosing

  if ( mouseX > 515 && mouseY > 525 && mouseX < 760 && mouseY < 575) {
    fill(360, 0, 20);
    rect(width/2-2, 550, 250, 60); //draw rectangle over the new game button
  }
  if ( mouseX > 505 && mouseY > 600 && mouseX < 770 && mouseY < 650) {
    fill(360, 0, 20);
    rect(width/2-2, 620, 280, 60); // draw rectangle over the highscore button
  }
}
