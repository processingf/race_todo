PGraphics ActiveView;

class viewer
{
  PGraphics View;
  float X, Y, Angle, Scale;
  int ViewX, ViewY, SizeX, SizeY;
  
  
  viewer(int viewx, int viewy, int sizex, int sizey)
  {
    X = Y = Angle = 0; Scale = 1;
    ViewX = viewx; ViewY = viewy;
    SizeX = sizex; SizeY = sizey;
    View = createGraphics(sizex, sizey, P2D);
  }
  
  void Draw()
  { image(View, ViewX, ViewY); }
  
  void BeginView()
  {
    View.beginDraw();
    View.translate(SizeX/2, SizeY/2);
    View.scale(Scale);
    View.rotate(-Angle);
    View.translate(-X, -Y);
    View.rectMode(CENTER);
    View.imageMode(CENTER);
    View.ellipseMode(CENTER);
    ActiveView = View;
  }
  
  void EndView()
  {
    View.fill(255);
    View.rect(0, 0, 10, 10);
    View.endDraw();
    ActiveView = null;
  }
}

