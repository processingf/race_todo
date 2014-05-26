class uicamera extends uielem
{
  PGraphics View;
  boolean Absolute;
  float AbsX, AbsY, AbsAngle;
  int ViewX, ViewY, Width, Height;
  
  
  uicamera(int vwx, int vwy, int wdth, int hght)
  {
    super(0, 0, 0, 1);
    Absolute = false;
    ViewX = vwx; ViewY = vwy;
    Width = wdth; Height = hght;
    AbsX = 0; AbsY = 0; AbsAngle = 0;
    View = createGraphics(Width, Height, P2D);
  }
  
  uicamera(XML xml, uielem parent)
  {
    super(xml, parent);
    Absolute = false;
    ViewX = xml.getInt("viewx");
    ViewY = xml.getInt("viewy");
    Width = xml.getInt("width");
    Height = xml.getInt("height");
    AbsX = 0; AbsY = 0; AbsAngle = 0;
    View = createGraphics(Width, Height, P2D);
  }
  
  void DrawThis(PGraphics v)
  {
    AbsX = modelX(0, 0, 0);
    AbsY = modelY(0, 0, 0);
    AbsAngle = atan2(modelY(1, 0, 0), modelX(1, 0, 0));
  }
  
  void BeginView()
  {
    PGraphics v = View;
    if(Absolute)
    { AbsX = X; AbsY = Y; AbsAngle = Angle; }
    v.beginDraw();
    v.translate(Width/2, Height/2);
    v.scale(Scale);
    v.rotate(-AbsAngle);
    v.translate(-AbsX, -AbsY);
    v.rectMode(CENTER);
    v.imageMode(CENTER);
  }
  
  void EndView()
  {
    PGraphics v = View;
    v.endDraw();
  }
  
  void Draw()
  { image(View, ViewX, ViewY); }
}

