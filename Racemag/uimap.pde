class uimap
{
  HashMap<String, PFont> Font;
  HashMap<String, String> Text;
  HashMap<String, PImage> Image;
  HashMap<String, PShape> Shape;
  HashMap<String, AudioPlayer> Sound;
  HashMap<String, uielem> Elem;
  uielem[][] Layer;
  
  uimap()
  {
    Font = new HashMap();
    Text = new HashMap();
    Image = new HashMap();
    Shape = new HashMap();
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
      tag tx = new tag(t[i]);
      String id = tx.GetString("id"); 
      switch(t[i].getName())
      {
        case "uielem":
        elem = new uielem(t[i], parent);
        break;
        case "uibox":
        elem = new uibox(t[i], parent);
        break;
        case "uirect":
        elem = new uirect(t[i], parent);
        break;
        case "uitext":
        elem = new uitext(t[i], parent);
        break;
        case "uishape":
        elem = new uishape(t[i], parent);
        break;
        case "uiimage":
        elem = new uiimage(t[i], parent);
        break;
        case "uicamera":
        elem = new uicamera(t[i], parent);
        default:
        elem = null;
        break;
      }
      if(elem == null) continue;
      Elem.put(id, elem);
      if(t[i].hasChildren())
      { LoadUiElem(t[i], elem); }
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
    LoadElem(xml, null);
  }
  
  void Draw(PGraphics v)
  {
    for(int i=0; i<Layer.length; i++)
    {
      for(int j=0; j<Layer[i].length; j++)
      {
        if(Layer[i][j] == null) continue;
        Layer[i][j].Draw(v);
      }
    }
  }
}

uimap UiMap = new uimap();

