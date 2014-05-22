class entity
{
  PImage Img;
  String Type;
  circle Pos;
  float Scale, Angle;
  circle[] RelColl, Coll;  // index 0 = master collision circle
  
  public entity(PImage img, String type, circle pos, float angle, float scale, circle[] relcoll)
  {
    Img = img;
    Type = type;
    Pos = pos;
    Angle = angle;
    Scale = scale;
    RelColl = relcoll;
    for(int i=0; i<relcoll.length; i++)
    { Coll[i] = new circle(relcoll[i]); }
  }
  
  public void UpdateColl()
  {
    for(int i=0; i<Coll.length; i++)
    { Coll[i].Transform(Pos, RelColl[i], Scale, Angle); }
  }
  
  public void Draw()
  {
    if(Angle == 0 && Scale == 1) image(Img, X, Y);
    else
    {
      pushMatrix();
      translate(X, Y);
      rotate(Angle);
      scale(Scale);
      image(Img, 0, 0);
      popMatrix();
    }
  }
  
  public boolean Collides(float x, float y)
  {
    boolean isColl = Coll[0].Intersects(x, y);
    if(!isColl || Coll.length == 1) return isColl;
    isColl = false;
    for(int i=1; i<Coll.length; i++)
    { isColl |= Coll[i].Intersects(x, y); }
    return isColl;
  }
  
  public boolean Collides(circle cir)
  {
    boolean isColl = Coll[0].Intersects(cir);
    if(!isColl || Coll.length == 1) return isColl;
    isColl = false;
    for(int i=1; i<Coll.length; i++)
    { isColl |= Coll[i].Intersects(cir); }
    return isColl;
  }
  
  public boolean Collides(entity obj)
  {
    boolean isColl = Collides(obj.Coll[0]);
    if(!isColl || obj.Coll.length == 1) return isColl;
    isColl = false;
    for(int i=1; i<obj.Coll.length; i++)
    { isColl |= Collides(obj.Coll[i]); }
    return isColl;
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
  
  public void draw()
  {
    image(Img, X, Y);
  }
}

