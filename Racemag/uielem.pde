class uielem
{
  float X, Y;
  float Angle, Scale;
  uielem Parent;
  uielem[] Children;
  boolean Drawn;
  float DrawDistance;
  final int Support = 0x1;
  
  uielem(float x, float y, float angle, float scale)
  {
    X = x; Y = y;
    Angle = angle;
    Scale = scale;
    DrawDistance = 0;
    Drawn = false;
  }
  
  uielem(XML xml, uielem parent)
  {
    tag t = new tag(xml);
    X = t.GetFloat("x", 0);
    Y = t.GetFloat("y", 0);
    Angle = t.GetFloat("angle", 0);
    Scale = t.GetFloat("scale", 1);
    DrawDistance = t.GetFloat("drawdistance", 0);
    if(parent != null) parent.AddChild(this);
  }
  
  // flaw: use model to get actual direction
  uielem GetDirection(float off)
  { return new uielem(cos(Angle+off), sin(Angle+off), off, 1); }
   
  void MoveDirection(float x, float y)
  {
    X += x*cos(Angle) - y*sin(Angle);
    Y += y*cos(Angle) + x*sin(Angle);
  }
  
  float GetDistanceTo(float x, float y)
  { return abs(X - x) + abs(Y - y); }
  
  void AddChild(uielem elem)
  {
    elem.Parent = this;
    if(Children == null) Children = new uielem[0];
    Children = (uielem[]) append(Children, elem);
  }
  
  boolean Supports(int type)
  { return (type & Support) > 0; }

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
    Drawn = true;
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

