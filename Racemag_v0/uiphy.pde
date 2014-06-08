class uiphy extends uielem
{
  float AbsX, AbsY, AbsAngle;
  uiphy PhyParent;
  uiphy[] PhyChildren;
  uiphy Owner;
  final int Support = 0x3;
  
  uiphy(float x, float y, float angle, float scale)
  {
    super(x, y, angle, scale);
    AbsX = 0; AbsY = 0;
    AbsAngle = 0;
  }
  
  void AddPhyChild(uiphy phy)
  {
    if(PhyChildren == null) PhyChildren = new uiphy[0];
    PhyChildren = (uiphy[]) append(PhyChildren, phy);
    phy.PhyParent = this;
  }
  
  void DrawThis(PGraphics v)
  {
    AbsX = modelX(0, 0, 0);
    AbsY = modelY(0, 0, 0);
    AbsAngle = atan2(modelY(1, 0, 0), modelX(1, 0, 0));
  }
  
  void StimulateThis(ArrayList<uiphy> phy)
  {}
  
  void Stimulate(ArrayList<uiphy> phy)
  {
    
  }
  
  void Respond(uiphyevent e)
  {
  }
}


class uiphyevent extends uielem
{ 
  uielem Owner;
  
  final int Support = 0x5;
  
  uiphyevent()
  { super(0, 0, 0, 0); }
}

