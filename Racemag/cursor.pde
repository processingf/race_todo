class cursor
{
  String Text;
  
  void Draw()
  {
    stroke(160, 255, 160, 180);
    fill(128, 255, 128, 180);
    rect(mouseX, mouseY, 10, 10);
    fill(0);
    if(Text != null) text(Text, mouseX, mouseY);
  }
}

cursor Cursor = new cursor();

