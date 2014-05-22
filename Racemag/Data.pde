PFont[] FontBuff;
PImage[] ImageBuff;
String[] StringBuff;
PShape[] ShapeBuff; 
AudioPlayer[] SoundBuff;
  
void AddFont(int id, PFont fnt)
{ if(id >= FontBuff.length) expand(FontBuff, 2*FontBuff.length); FontBuff[id] = fnt; }
  
void AddImage(int id, PImage img)
{ if(id >= ImageBuff.length) expand(ImageBuff, 2*ImageBuff.length); ImageBuff[id] = img; }
  
void AddString(int id, String str)
{ if(id >= StringBuff.length) expand(StringBuff, 2*StringBuff.length); StringBuff[id] = str; }
  
void AddShape(int id, PShape shp)
{ if(id >= ShapeBuff.length) expand(ShapeBuff, 2*ShapeBuff.length); ShapeBuff[id] = shp; }
  
void AddSound(int id, AudioPlayer snd)
{ if(id >= SoundBuff.length) expand(SoundBuff, 2*SoundBuff.length); SoundBuff[id] = snd; }
  
PFont GetFont(int id)
{ return FontBuff[id]; }

PImage GetImage(int id)
{ return ImageBuff[id]; }
  
String GetString(int id)
{ return StringBuff[id]; }
  
PShape GetShape(int id)
{ return ShapeBuff[id]; }
  
AudioPlayer GetSound(int id)
{ return SoundBuff[id]; }
  
void ClearFonts()
{ FontBuff = new PFont[16]; }
  
void ClearImages()
{ ImageBuff = new PImage[16]; }
  
void ClearStrings()
{ StringBuff = new String[16]; }
  
void ClearShapes()
{ ShapeBuff = new PShape[16]; }
  
void ClearSounds()
{ SoundBuff = new AudioPlayer[16]; }
  
void ClearAllData()
{
  ClearFonts();
  ClearImages();
  ClearStrings();
  ClearShapes();
  ClearSounds();
}
  
void LoadFonts(XML xml)
{
  XML[] fntXml = xml.getChildren("loadfont");
  for(int i=0; i<fntXml.length; i++)
  {
    int id = fntXml[i].getInt("id");
    String file = fntXml[i].getString("file");
    AddFont(id, loadFont(file));
  }
}
  
void LoadImages(XML xml)
{
  XML[] imgXml = xml.getChildren("loadimage");
  for(int i=0; i<imgXml.length; i++)
  {
    int id = imgXml[i].getInt("id");
    String file = imgXml[i].getString("file");
    AddImage(id, loadImage(file));
  }
}
  
void LoadStrings(XML xml)
{
  XML[] strXml = xml.getChildren("setstring");
  for(int i=0; i<strXml.length; i++)
  {
    int id = strXml[i].getInt("id");
    String value = strXml[i].getString("value");
    AddString(id, value);
  }
}
  
void LoadShapes(XML xml)
{
  XML[] shpXml = xml.getChildren("loadshape");
  for(int i=0; i<shpXml.length; i++)
  {
    int id = shpXml[i].getInt("id");
    String file = shpXml[i].getString("file");
    AddShape(id, loadShape(file));
  }
}
  
void LoadSounds(XML xml)
{
  XML[] sndXml = xml.getChildren("loadsound");
  for(int i=0; i<sndXml.length; i++)
  {
    int id = sndXml[i].getInt("id");
    String file = sndXml[i].getString("file");
    AddSound(id, minim.loadFile(file));
  }
}
  
void LoadAllData(XML xml)
{
  LoadFonts(xml);
  LoadImages(xml);
  LoadStrings(xml);
  LoadShapes(xml);
  LoadSounds(xml);
}


void textFont(int id)
{ textFont(GetFont(id)); }

void textFont(int id, float size)
{ textFont(GetFont(id), size); }

void image(int id, float x, float y)
{ image(GetImage(id), x, y); }

void image(int id, float x, float y, float xsize, float ysize)
{ image(GetImage(id), x, y, xsize, ysize); }

String string(int id)
{ return GetString(id); }

AudioPlayer sound(int id)
{ return GetSound(id); }

