class uielem
{
  float X, Y;
  float Angle, Scale;
  uielem Parent;
  uielem[] Children;
  boolean Drawn;
  float DrawDistance;
  
  uielem(uielem e)
  {
    X = e.X; Y = e.Y;
    Angle = e.Angle;
    Scale = e.Scale;
    Parent = e.Parent;
    Children = e.Children;
    DrawDistance = e.DrawDistance;
  }
  
  uielem(float x, float y, float angle, float scale)
  {
    X = x; Y = y;
    Angle = angle;
    Scale = scale;
    DrawDistance = 0;
  }
  
  uielem GetDirection(float off)
  { return new uielem(cos(Angle+off), sin(Angle+off), off, 1); } 
  
  float GetDistanceTo(float x, float y)
  { return abs(X - x) + abs(Y - y); }
  
  boolean Supports(int type)
  { return type == 0; }

  void UpdateThis() {}
  
  void Update()
  {
    Drawn = false;
    UpdateThis();
    if(Children == null) return;
    for(int i=0; i<Children.length; i++)
    { Children[i].Update(); }
  }
  
  void DrawThis(PGraphics v) {}
  
  void Draw(PGraphics v)
  {
    if(Drawn) return;
    v.pushMatrix();
    v.translate(X, Y);
    v.rotate(Angle);
    v.scale(Scale);
    DrawThis(v);
    if(Children != null)
    {
      for(int i=0; i<Children.length; i++)
     { Children[i].Draw(v); } 
    }
    v.popMatrix();
  }
}

