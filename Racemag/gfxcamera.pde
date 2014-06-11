PVector ViewSz = new PVector(width/2, height/2);
float ViewRange = ViewSz.mag(); 

class gfxcamera extends gfxelem
{
  PVector Ref, Dir, Abs;
  float RefAngle, AbsAngle;
  
  gfxcamera(PVector p, float a, float s)
  {
    super(p, a, s);
    Ref = new PVector();
    Dir = new PVector();
    Abs = new PVector();
  }
  
  void DrawThis()
  {
    Ref.x = modelX(0, 0, 0) - ViewSz.x;
    Ref.y = modelY(0, 0, 0) - ViewSz.y;
    Dir.x = modelX(1, 0, 0) - ViewSz.x - Ref.x;
    Dir.y = modelY(1, 0, 0) - ViewSz.y - Ref.y;
    RefAngle = Dir.heading();
    AbsAngle += RefAngle;
    Abs.add(Ref);
  }
  
  void BeginView()
  {
    translate(ViewSz.x, ViewSz.y);
    scale(Scale);
    rotate(-AbsAngle);
    translate(-Abs.x, -Abs.y);
  }
  
  void EndView() {}
}

