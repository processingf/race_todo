class gfxrect extends gfxelem
{
  float Width, Height;
  color EdgeColor, FillColor;
  float EdgeWidth;
  
  gfxrect(PVector p, float a, float s, float w, float h, float ew, color ec, color fc)
  {
    super(p, a, s);
    Width = w; Height = h;
    EdgeWidth = ew;
    EdgeColor = ec;
    FillColor = fc;
  }
  
  void DrawShape()
  { rect(0, 0, Width, Height); }
  
  void DrawThis()
  {
    if(EdgeColor == 0) noStroke();
    else { strokeWeight(EdgeWidth); stroke(EdgeColor); }
    if(FillColor == 0) noFill();
    else fill(FillColor);
    DrawShape();
  }
}


class gfxellipse extends gfxrect
{
  gfxellipse(PVector p, float a, float s, float w, float h, float ew, color ec, color fc)
  { super(p, a, s, w, h, ew, ec, fc); }
  
  void DrawShape()
  { ellipse(0, 0, Width, Height); }
}


class gfxarc extends gfxrect
{
  float StartAngle, StopAngle;
  int Mode;
  
  gfxarc(PVector p, float a, float s, float w, float h, float ew, color ec, color fc, float st, float sp, int m)
  {
    super(p, a, s, w, h, ew, ec, fc);
    StartAngle = st;
    StopAngle = sp;
    Mode = m; 
  }
  
  void DrawShape()
  { arc(0, 0, Width, Height, StartAngle, StopAngle, Mode); }
}


class gfxtext extends gfxelem
{
  String Text;
  PFont Font; float Size;
  float Width, Height;
  int AlignX, AlignY;
  boolean Boxed;
  color Color;
  
  gfxtext(PVector p, float a, float s, float w, float h, color c, String t, PFont f, float sz, int ax, int ay, boolean b)
  {
    super(p, a, s);
    Text = t; Font = f; Size = sz;
    Width = w; Height = h; Color = c;
    AlignX = ax; AlignY = ay;
    Boxed = b;
  }
  
  void DrawThis()
  {
    fill(Color);
    textFont(Font, Size);
    textAlign(AlignX, AlignY);
    if(Boxed) text(Text, 0, 0, Width, Height);
    else text(Text, 0, 0);
  }
}


class gfxshape extends gfxelem
{
  PShape Shape;
  
  gfxshape(PVector p, float a, float s, PShape sh)
  { super(p, a, s); Shape = sh; }

  gfxshape(PVector p, float a, float s, PImage i, int m, float[] vx, float[] vy, float[] ix, float[] iy)
  { super(p, a, s); Build(i, m, vx, vy, ix, iy); }
  
  void Build(PImage txtr, int mode, float[] vx, float[] vy, float[] ix, float[] iy)
  {
    PShape s = createShape();
    s.beginShape();
    s.textureMode(mode);
    s.texture(txtr);
    for(int i=0; i<vx.length; i++)
    { s.vertex(vx[i], vy[i], ix[i], iy[i]); }
    s.endShape(CLOSE);
    Shape = s;
  }

  void DrawThis()
  { shape(Shape, 0, 0); }
}


class gfximage extends gfxelem
{
  PImage Image;
  color TintColor;
  int Mode;
  
  gfximage(PVector p, float a, float s, PImage i, color t, int m)
  { super(p, a, s); Image = i; TintColor = t; Mode = m; }
  
  void DrawThis()
  {
    if(TintColor == 0) noTint();
    else tint(TintColor);
    if(Mode == 0) image(Image, 0, 0);
    else blend(Image, 0, 0, Image.width, Image.height, 0, 0, Image.width, Image.height, Mode);
  }
}

