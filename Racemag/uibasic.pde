// draw distance issue (it changes upon scaling)

class uirect extends uielem
{
  color Color;
  float Width, Height;
  
  uirect(color clr, float wdth, float hght, float x, float y, float size, float angle)
  {
    super(x, y, size, angle);
    Color = clr;
    Width = wdth;
    Height = hght;
    DrawDistance = wdth + hght;
  }
  
  private void DrawThis(PGraphics v)
  { v.rect(0, 0, Width, Height); }
}


class uishape extends uirect
{
  PShape Shape;
  
  uishape(PShape shp, float x, float y, float size, float angle)
  {
    super(0, shp.width, shp.height, x, y, size, angle);
    Shape = shp;
  }
  
  private void DrawThis(PGraphics v)
  { v.shape(Shape, 0, 0, Width, Height); }
}


class uiimage extends uirect
{
  PImage Image;
  
  uiimage(PImage img, float x, float y, float size, float angle)
  {
    super(0, img.width, img.height, x, y, size, angle);
    Image = img;
  }
  
  private void DrawThis(PGraphics v)
  { v.image(Image, 0, 0, Width, Height); }
}


class uitext extends uirect
{
  String Text;
  PFont Font;
  boolean Boxed;
  int AlignX, AlignY;
  
  uitext(String txt, PFont fnt, float txtSz, color clr, float x, float y, float size, float angle)
  {
    super(
  } 
}


class uiblendimage extends uirect
{
  PImage Image;
  
  uiimage(PImage img, float x, float y, float size, float angle)
  {
    super(img.width, img.height, x, y, size, angle);
    Image = img;
  }
  
  private void DrawThis(PGraphics v)
  { v.image(Image, 0, 0, Width, Height); }
}


