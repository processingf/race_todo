class gfxelem extends viselem
{
  // data
  float Angle, Scale;
  final int Flags = 0x0100;

  // functions
  gfxelem(PVector p, float a, float s)
  { super(p); Angle = a; Scale = s; }

  PVector GetDirection(float off)
  { return PVector.fromAngle(Angle+off); }
  
  void MoveDirection(float d, float off)
  { Pos.add(PVector.mult(GetDirection(off), d)); }
  
  void Draw()
  {
    pushMatrix();
    translate(Pos.x, Pos.y);
    rotate(Angle);
    scale(Scale);
    DrawThis();
    for(int i=0; i<Children.size(); i++)
    { Children.get(i).Draw(); } 
    popMatrix();
  }


} // end class gfxelem

