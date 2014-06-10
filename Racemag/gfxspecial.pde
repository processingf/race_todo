class gfxrange extends gfxelem
{
  PVector Ref, Dir;
  float Range, RefRange;
  
  gfxrange(PVector p, float a, float s, float r)
  {
    super(p, a, s); Range = r;
    Ref = new PVector();
    Dir = new PVector();
  }
  
  void UpdateRange()
  {
    Ref.x = modelX(0, 0, 0);
    Ref.y = modelY(0, 0, 0);
    Dir.x = modelX(1, 0, 0) - Ref.x;
    Dir.y = modelY(1, 0, 0) - Ref.y;
    RefRange = Range * Dir.mag();
  }
  
  boolean IsInRange()
  {
    return true;
  }
  
  void Draw()
  {
    pushMatrix();
    translate(Pos.x, Pos.y);
    rotate(Angle);
    scale(Scale);
    UpdateRange();
    if(IsInRange())
    {
      DrawThis();
      for(int i=0; i<Children.size(); i++)
      { Children.get(i).Draw(); } 
      popMatrix();
    }
  }
}


class gfxsplit extends gfxrange
{
  float SplitRange, RefSplitRange;
  
  
  gfxsplit(PVector p, float a, float s, float r, float sr)
  { super(p, a, s, r); SplitRange = sr; }
  
  void UpdateRange()
  {
    super.UpdateRange();
    RefSplitRange = SplitRange * Dir.mag();
  }
  
  boolean IsInSplitRange()
  { return true; }
  
  
  void Draw()
  {
    pushMatrix();
    translate(Pos.x, Pos.y);
    rotate(Angle);
    scale(Scale);
    UpdateRange();
    if(IsInRange())
    {
      DrawThis();
      for(int i=0; i<Children.size(); i++)
      { Children.get(i).Draw(); } 
      popMatrix();
    }
  }
}

