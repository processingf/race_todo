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
    View.translate(X, Y);
    View.rotate(Angle);
    View.scale(Scale);
    View.rectMode(CENTER);
    View.imageMode(CENTER);
    View.ellipseMode(CENTER);
    ActiveView = View;
  }
  
  void EndView()
  {
    View.endDraw();
    ActiveView = null;
  }
}

