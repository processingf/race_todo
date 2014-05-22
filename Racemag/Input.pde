int[] KeyMap;
String[] KeyName; 
boolean[] ActiveKey;

// key constants
//public enum Key
//{
//  A
//};

void ClearKeyNames()
{ KeyName = new String[256]; }

void ClearKeyMap()
{ KeyMap = new int[256]; }

void ClearActiveKeys()
{ ActiveKey = new boolean[256]; }

void LoadKeyNames(XML xml)
{
  XML[] keyXml = xml.getChildren("keyname");
  for(int i=0; i<keyXml.length; i++)
  {
    int id = keyXml[i].getInt("id");
    String value = keyXml[i].getString("value");
    KeyName[id] = value;
  }
}

void LoadKeyMap(XML xml)
{
  XML[] mapXml = xml.getChildren("keymap");
  for(int i=0; i<mapXml.length; i++)
  {
    int id = mapXml[i].getInt("id");
    int value = mapXml[i].getInt("value");
    KeyMap[id] = value;
  }
}

void keyPressed()
{ ActiveKey[KeyMap[keyCode]] = true; }

void keyReleased()
{ ActiveKey[KeyMap[keyCode]] = false; }

