void high() {

  if ( mouseX > 575 && mouseY > 680 && mouseX < 705 && mouseY < 725) {
    fill(360, 0, 20);
    rect(width/2-2, 700, 140, 60); // if the mouse hovers over the back button then draw a rectangle over it
  }

  fill(360); 
  noTint();
  image(img[11], width/2, 150); // the highscore to beat image
  textSize(40);
  for (int i = 0; i < high.length; i++) {
    y = i *40 + 300;
    text(1+i, width/2-60, y);
    text(".", width/2-45, y);
    text(high[i], width/2+20, y );
  }

  image(img[10], width/2, 700, 200, 60); // back button image
}
