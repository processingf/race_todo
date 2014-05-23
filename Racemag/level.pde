class level
{
  PFont[] Font;
  PImage[] Image;
  String[] Text;
  AudioPlayer[] Sound;
  entity[][] Entity;
  
  level()
  {
    Font = new PFont[16];
    Image = new PImage[16];
    Text = new String[16];
    Sound = new AudioPlayer[16];
    Entity = new entity[16][];
    for(int i=0; i<16; i++)
    { Entity[i] = new entity[16]; }
  }

  void AddFont(int id, PFont fnt)
  { if(id >= Font.length) expand(Font, id+16); Font[id] = fnt; }
    
  void AddImage(int id, PImage img)
  { if(id >= Image.length) expand(Image, id+16); Image[id] = img; }
    
  void AddText(int id, String txt)
  { if(id >= Text.length) expand(Text, id+16); Text[id] = txt; }
    
  void AddSound(int id, AudioPlayer snd)
  { if(id >= Sound.length) expand(Sound, id+16); Sound[id] = snd; }
  
  void AddEntity(entity obj, int layer, int id)
  { if(Entity[layer].length <= id) expand(Entity[layer], id+16); Entity[layer][id] = obj; }
    
  void LoadFonts(XML xml)
  {
    XML[] fntXml = xml.getChildren("font");
    for(int i=0; i<fntXml.length; i++)
    {
      int id = fntXml[i].getInt("id");
      String file = fntXml[i].getString("file");
      AddFont(id, loadFont(file));
    }
  }
    
  void LoadImages(XML xml)
  {
    XML[] imgXml = xml.getChildren("image");
    for(int i=0; i<imgXml.length; i++)
    {
      int id = imgXml[i].getInt("id");
      String file = imgXml[i].getString("file");
      AddImage(id, loadImage(file));
    }
  }
    
  void LoadTexts(XML xml)
  {
    XML[] strXml = xml.getChildren("text");
    for(int i=0; i<strXml.length; i++)
    {
      int id = strXml[i].getInt("id");
      String value = strXml[i].getString("value");
      AddText(id, value);
    }
  }
    
  void LoadSounds(XML xml)
  {
    XML[] sndXml = xml.getChildren("sound");
    for(int i=0; i<sndXml.length; i++)
    {
      int id = sndXml[i].getInt("id");
      String file = sndXml[i].getString("file");
      AddSound(id, minim.loadFile(file));
    }
  }
  
  void LoadEntities(XML xml)
  {
    XML[] objXml = xml.getChildren("entity");
    for(int i=0; i<objXml.length; i++)
    {
      int id = objXml[i].getInt("id");
      int layer = objXml[i].getInt("layer");
      int image = objXml[i].getInt("image");
      float x = objXml[i].getFloat("x");
      float y = objXml[i].getFloat("y");;
      float angle = objXml[i].getFloat("angle");
      float scale = objXml[i].getFloat("scale");
      entity obj = new entity(Image[image], x, y, angle, scale);
      AddEntity(obj, layer, id); 
    }
  }
  
  void Load(String file)
  {
    XML xml = loadXML(file);
    LoadFonts(xml);
    LoadImages(xml);
    LoadTexts(xml);
    LoadSounds(xml);
    LoadEntities(xml);
  }
  
  void Draw(PGraphics v)
  {
    v.background(255);
    for(int i=0; i<Entity.length; i++)
    {
      for(int j=0; j<Entity[i].length; j++)
      {
        if(Entity[i][j] == null) continue;
        Entity[i][j].Draw(v);
      }
    }
  }
}

