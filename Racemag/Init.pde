Minim minim = new Minim(this);
PImage roadImg;
uicamera CamP1;
uimap Level;

void Init()
{
  textSize(24);
  Input.Load();
  Input.Save();
  CamP1 = new uicamera(100, 100, 500, 500);
  Level = new uimap();
  Level.Load("level0.xml");
  Level.Sound[0].play();
}

void LoadPlayers()
{
//  Player1 = new car("Rinku", CarImg[0]);
//  Player2 = new car("Rony", CarImg[1]);
}

