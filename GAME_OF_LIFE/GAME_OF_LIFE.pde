int time = 0;
int charSize = 4;
Game_of_Life gol;
Cam cam;
boolean display = false;
void setup()
{
  size(720,720);
  
  
  gol = new Game_of_Life();
  cam = new Cam();
}

void mousePressed()
{
  gol.init();
}

void keyPressed()
{
  if(key == 'd')display = !display;
  
}

void draw()
{
  background(0);
  //cam.runCam();
  if(display)
  {
    if(time % 10 == 0)
    {
      gol.generate();
    }
    gol.disp();
    time += 10;
    if(time > 50)time = 0;
  }
}
