class Img
{
  PImage img;
  
  Img()
  {
    img = loadImage("OpnS.png");

  }
  
  
  color returnColor(int x, int y)
  {
    img.loadPixels();
    color c;
    int loc =   x   + y * img.width;
    c = img.pixels[loc];
    return c;
  }
}
