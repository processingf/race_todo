class uicamera extends uielem
{
  PGraphics View;
  float CamX, CamY, CamAngle;
  int ViewX, ViewY, Width, Height;
  
  
  uicamera(int vwx, int vwy, int wdth, int hght)
  {
    super(0, 0, 0, 1);
    ViewX = vwx; ViewY = vwy;
    Width = wdth; Height = hght;
    CamX = 0; CamY = 0; CamAngle = 0;
    View = createGraphics(Width, Height, P2D);
  }
  
  uicamera(XML xml, uielem parent)
  {
    super(xml, parent);
    ViewX = xml.getInt("viewx");
    Viewy = xml.getInt("viewy");
    Width = xml.getInt("width");
    Height = xml.getInt("height");
    CamX = 0; CamY = 0; CamAngle = 0;
    View = createGraphics(Width, Height, P2D);
  }
  
  void Draw(PGraphics v)
  {
    CamX = modelX(0, 0, 0);
    CamY = modelY(0, 0, 0);
    CamAngle = atan2(modelY(1, 0, 0), modelX(1, 0, 0));
  }
  
  void BeginView()
  {
    PGraphics v = View;
    v.beginDraw();
    v.translate(Width/2, Height/2);
    v.scale(Scale);
    v.rotate(-CamAngle);
    v.translate(-CamX, -CamY);
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

