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
    Ref.x = modelX(0, 0, 0) - ViewSz.x;
    Ref.y = modelY(0, 0, 0) - ViewSz.y;
    Dir.x = modelX(1, 0, 0) - ViewSz.x - Ref.x;
    Dir.y = modelY(1, 0, 0) - ViewSz.y - Ref.y;
    RefRange = Range * Dir.mag();
  }
  
  void Draw()
  {
    pushMatrix();
    translate(Pos.x, Pos.y);
    rotate(Angle);
    scale(Scale);
    UpdateRange();
    if(Ref.mag() <= ViewRange + RefRange)
    {
      DrawThis();
      for(int i=0; i<Children.size(); i++)
      { Children.get(i).Draw(); } 
    }
    popMatrix();
  }
}


class gfxselrange extends gfxrange
{
  float SelRange, RefSelRange;
  ArrayList<viselem> SelIn, SelOut;
  
  gfxselrange(PVector p, float a, float s, float r, float sr)
  { super(p, a, s, r); SelRange = sr; }
  
  void UpdateRange()
  {
    super.UpdateRange();
    RefSelRange = SelRange * Dir.mag();
  }
  
  void Draw()
  {
    pushMatrix();
    translate(Pos.x, Pos.y);
    rotate(Angle);
    scale(Scale);
    UpdateRange();
    float dist = Ref.mag();
    if(dist <= ViewRange + RefRange)
    {
      DrawThis();
      for(int i=0; i<Children.size(); i++)
      { Children.get(i).Draw(); }
      if(dist <= RefSelRange) for(int i=0; i<SelIn.size(); i++)
      { SelIn.get(i).Draw(); }
      else for(int i=0; i<SelOut.size(); i++)
      { SelOut.get(i).Draw(); }
    }
    popMatrix();
  }
}


class gfxselscale extends gfxrange
{
  float SelScale, RefSelScale;
  ArrayList<viselem> SelCon, SelExp;
  
  gfxselscale(PVector p, float a, float s, float r, float ss)
  { super(p, a, s, r); SelScale = ss; }
  
  void UpdateRange()
  {
    super.UpdateRange();
    RefSelScale = SelScale * Dir.mag();
  }
  
  void Draw()
  {
    pushMatrix();
    translate(Pos.x, Pos.y);
    rotate(Angle);
    scale(Scale);
    UpdateRange();
    if(Ref.mag() <= ViewRange + RefRange)
    {
      DrawThis();
      for(int i=0; i<Children.size(); i++)
      { Children.get(i).Draw(); }
      if(Dir.mag() <= RefSelScale) for(int i=0; i<SelCon.size(); i++)
      { SelCon.get(i).Draw(); }
      else for(int i=0; i<SelExp.size(); i++)
      { SelExp.get(i).Draw(); }
    }
    popMatrix();
  }
}

