class circle
{
  float X, Y, Radius;
  
  public circle(float x, float y, float radius)
  { X = x; Y = y; Radius = radius; }
  
  public circle(circle cir)
  { this(cir.X, cir.Y, cir.Radius); }
  
  public void Transform(circle centre, circle rel, float scale, float angle)
  {
    X = centre.X + scale*(rel.X*cos(angle) - rel.Y*sin(angle));
    Y = centre.Y + scale*(rel.Y*cos(angle) + rel.X*sin(angle));
  }
  
  public boolean Intersects(float x, float y)
  {
    float delX = x - X;
    float delY = y - Y;
    float dist = sqrt(delX*delX + delY*delY);
    return dist < Radius;
  }
  
  public boolean Intersects(circle cir)
  {
    float delX = cir.X - X;
    float delY = cir.Y - Y;
    float dist = sqrt(delX*delX + delY*delY);
    return dist < (cir.Radius + Radius);
  }
}

