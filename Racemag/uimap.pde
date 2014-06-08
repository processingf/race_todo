class uimap
{
  HashMap<String, PFont> Font;
  HashMap<String, String> Text;
  HashMap<String, PImage> Image;
  HashMap<String, PShape> Shape;
  HashMap<String, AudioPlayer> Sound;
  HashMap<String, uielem> Elem;
  ArrayList<uielem>[] Layer;
  
  uimap()
  {
    Font = new HashMap();
    Text = new HashMap();
    Image = new HashMap();
    Shape = new HashMap();
    Sound = new HashMap();
    Elem = new HashMap();
    Layer = new ArrayList[16];
    for(int i=0; i<16; i++)
    { Layer[i] = new ArrayList(); }
  }
  
  void LoadFont(XML xml)
  {
    XML[] t = xml.getChildren("loadfont");
    for(int i=0; i<t.length; i++)
    {
      String id = t[i].getString("id");
      String file = t[i].getString("file");
      Font.put(id, loadFont(file));
    }
  }
    
  void LoadText(XML xml)
  {
    XML[] t = xml.getChildren("loadtext");
    for(int i=0; i<t.length; i++)
    {
      String id = t[i].getString("id");
      String value = t[i].getString("value");
      Text.put(id, value);
    }
  }
    
  void LoadImage(XML xml)
  {
    XML[] t = xml.getChildren("loadimage");
    for(int i=0; i<t.length; i++)
    {
      String id = t[i].getString("id");
      String file = t[i].getString("file");
      Image.put(id, loadImage(file));
    }
  }
    
  void LoadShape(XML xml)
  {
    XML[] t = xml.getChildren("loadshape");
    for(int i=0; i<t.length; i++)
    {
      String id = t[i].getString("id");
      String file = t[i].getString("file");
      Shape.put(id, loadShape(file));
    }
  }
    
  void LoadSound(XML xml)
  {
    XML[] t = xml.getChildren("loadsound");
    for(int i=0; i<t.length; i++)
    {
      String id = t[i].getString("id");
      String file = t[i].getString("file");
      Sound.put(id, minim.loadFile(file));
    }
  }
  
  void LoadUiElem(XML xml, uielem parent)
  {
    uielem elem;
    XML[] t = xml.getChildren();
    for(int i=0; i<t.length; i++)
    {
      if(t[i].toString().length() == 0) continue;
      tag tx = new tag(t[i]);
      String nm = t[i].getName();
      if(nm.equals("uielem")) elem = new uielem(t[i], parent);
      else if(nm.equals("uibox")) elem = new uibox(t[i], parent);
      else if(nm.equals("uirect")) elem = new uirect(t[i], parent);
      else if(nm.equals("uitext")) elem = new uitext(t[i], parent);
      else if(nm.equals("uishape")) elem = new uishape(t[i], parent);
      else if(nm.equals("uiimage")) elem = new uiimage(t[i], parent);
      else if(nm.equals("uicamera")) elem = new uicamera(t[i], parent);
      else continue;
      String id = tx.GetString("id");
      Elem.put(id, elem);
      if(t[i].hasChildren())
      { LoadUiElem(t[i], elem); }
    }
  }
  
  void MapUiElem(XML xml)
  {
    XML[] t = xml.getChildren("mapuielem");
    for(int i=0; i<t.length; i++)
    {
      int layer = t[i].getInt("layer");
      String id = t[i].getString("id");
      Layer[layer].add(Elem.get(id));
    }
  }
  
  void Load(String file)
  {
    XML xml = loadXML(file);
    LoadFont(xml);
    LoadText(xml);
    LoadImage(xml);
    LoadShape(xml);
    LoadSound(xml);
    LoadUiElem(xml, null);
    MapUiElem(xml);
  }
  
  void Refresh()
  {
    for(int i=0; i<Layer.length; i++)
    {
      for(int j=0; j<Layer[i].size(); j++)
      { Layer[i].get(j).Refresh(); }
    }
  }
  
  void Draw(PGraphics v)
  {
    for(int i=0; i<Layer.length; i++)
    {
      for(int j=0; j<Layer[i].size(); j++)
      { Layer[i].get(j).Draw(v); }
    }
  }
}

uimap UiMap = new uimap();

