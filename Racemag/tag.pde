class tag
{
  XML Xml;
  
  tag(XML xml)
  { Xml = xml; }
  
  int GetInt(String attr, int dflt)
  { return (Xml.hasAttribute(attr))? Xml.getInt(attr) : dflt; }
  
  float GetFloat(String attr, float dflt)
  { return (Xml.hasAttribute(attr))? Xml.getFloat(attr) : dflt; }
  
  String GetString(String attr, String dflt)
  { return (Xml.hasAttribute(attr))? Xml.getString(attr) : dflt; }
  
  boolean GetBoolean(String attr, boolean dflt)
  { return (Xml.hasAttribute(attr))? Xml.getString(attr).equalsIgnoreCase("true") : dflt; }
  
  int GetHexInt(String attr, int dflt)
  { return (Xml.hasAttribute(attr))? (int)(Long.parseLong(Xml.getString(attr), 16)) : dflt; }
  
  Integer GetInt(String attr)
  { return (Xml.hasAttribute(attr))? new Integer(Xml.getInt(attr)) : null; }
  
  Float GetFloat(String attr)
  { return (Xml.hasAttribute(attr))? new Float(Xml.getFloat(attr)) : null; }
  
  String GetString(String attr)
  { return (Xml.hasAttribute(attr))? Xml.getString(attr) : null; }
  
  Boolean GetBoolean(String attr)
  { return (Xml.hasAttribute(attr))? new Boolean(Xml.getString(attr).equalsIgnoreCase("true")) : null; }
  
  Integer GetHexInt(String attr)
  { return (Xml.hasAttribute(attr))? new Integer((int)(Long.parseLong(Xml.getString(attr), 16))) : null; }
}

