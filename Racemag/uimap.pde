class uimap
{
  HashMap<String, PFont> Font;
  HashMap<String, PImage> Image;
  HashMap<String, String> Text;
  HashMap<String, AudioPlayer> Sound;
  HashMap<String, uielem> Elem;
  uielem[][] Layer;
  
  level()
  {
    Font = new HashMap();
    Image = new HashMap();
    Text = new HashMap();
    Sound = new HashMap();
    Elem = new HashMap();
    Layer = new uielem[16][];
    for(int i=0; i<16; i++)
    { Layer[i] = new uielem[16]; }
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
    
  void LoadText(XML xml)
  {
    XML[] t = xml.getChildren("text");
    for(int i=0; i<t.length; i++)
    {
      String id = t[i].getString("id");
      String value = t[i].getString("value");
      Text.put(id, value);
    }
  }
    
  void LoadSound(XML xml)
  {
    XML[] t = xml.getChildren("sound");
    for(int i=0; i<t.length; i++)
    {
      String id = t[i].getString("id");
      String file = t[i].getString("file");
      Sound.put(id, minim.loadFile(file));
    }
  }
  
  void LoadElem(XML xml)
  {
    XML[] t = xml.getChildren();
    for(int i=0; i<t.length; i++)
    {
      tag tx = new tag(t[i]);
      String name = t[i].getName();
      String id = tx.GetString("id");
      Float x = tx.GetFloat("x");
      Float y = tx.GetFloat("y");
      Float angle = tx.GetFloat("angle");
      Float scale = tx.GetFloat("scale");
      Float drawdistance = tx.GetFloat("drawdistance");
      Float width_ = tx.GetFloat("width");
      Float height_ = tx.GetFloat("height");
      
      entity obj = new entity(Image[image], x, y, angle, scale);
      AddEntity(obj, layer, id); 
    }
  }
  
  void Load(String file)
  {
    XML xml = loadXML(file);
    LoadFont(xml);
    LoadImage(xml);
    LoadText(xml);
    LoadSound(xml);
    LoadElem(xml);
  }
  
  void Draw(PGraphics v)
  {
    v.background(255);
    for(int i=0; i<Elem.length; i++)
    {
      for(int j=0; j<Elem[i].length; j++)
      {
        if(Elem[i][j] == null) continue;
        Elem[i][j].Draw(v);
      }
    }
  }
}

