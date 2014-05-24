class entity
{
  PImage Img;
  float X, Y, Angle, Scale;
  
  public entity(PImage img, float x, float y, float angle, float scale)
  {
    Img = img;
    X = x; Y = y;
    Angle = angle;
    Scale = scale;
    
  }

  public void Draw(PGraphics v)
  {
    if(Angle == 0 && Scale == 1) v.image(Img, X, Y);
    else
    {
      v.pushMatrix();
      v.translate(X, Y);
      v.rotate(Angle);
      v.scale(Scale);
      v.image(Img, 0, 0);
      v.popMatrix();
    }
  }
}

class car
{
  String Name;
  PImage Img;
  float X, Y;
  float Width, Height;
  float Speed;
  
  public car(String name, PImage img)
  {
    Name = name; Img = img;
    X = 0; Y = 0;
    Width = img.width;
    Height = img.height;
    Speed = 0;
  }
  
  public void Draw(PGraphics v)
  {
    v.image(Img, X, Y);
  }
}

