class uicamera extends uielem
{
  PGraphics View;
  int ViewX, ViewY, Width, Height;
  
  
  uicamera(int vwx, int vwy, int wdth, int hght)
  {
    super(0, 0, 0, 1);
    ViewX = vwx; ViewY = vwy;
    Width = wdth; Height = hght;
    View = createGraphics(Width, Height, P2D);
  }
  
  void Draw(PGraphics v)
  {
    X = modelX(0, 0, 0);
    Y = modelY(0, 0, 0);
    Angle = atan2(modelY(1, 0, 0), modelX(1, 0, 0));
  }
  
  void BeginView()
  {
    PGraphics v = View;
    v.beginDraw();
    v.translate(Width/2, Height/2);
    v.scale(Scale);
    v.rotate(-Angle);
    v.translate(-X, -Y);
    v.rectMode(CENTER);
    v.imageMode(CENTER);
    v.ellipseMode(CENTER);
  }
  
  void EndView()
  {
    PGraphics v = View;
    v.fill(255);
    v.rect(0, 0, 10, 10);
    v.endDraw();
  }
  
  void Draw()
  { image(View, ViewX, ViewY); }
}

