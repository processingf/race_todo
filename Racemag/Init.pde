Minim minim = new Minim(this);
PImage roadImg;
viewer Vwr1;
viewer CamP1;
level Level;

void Init()
{
  textSize(24);
  Input.Load();
  Input.Save();
  Vwr1 = new viewer(0, 0, 100, 100);
  CamP1 = new viewer(100, 100, 500, 500);
  Level = new level();
  Level.Load("level0.xml");
  Level.Sound[0].play();
}

void LoadPlayers()
{
//  Player1 = new car("Rinku", CarImg[0]);
//  Player2 = new car("Rony", CarImg[1]);
}

