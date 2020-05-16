class Cell
{
  int x;
  int y;
  int w;
  int state;
  int previous;
  
  Cell(int _x, int _y, int _w)
  {
    w = _w;
    x = _x;
    y = _y;
    
    state = int(random(2));
    previous = state;
  }
   
  void savePrevious() 
  {
    previous = state; 
  }

  void newState(int s) 
  {
    state = s;
  }

  void display() 
  {
    if (previous == 0 && state == 1) fill(0,0,255);
    else if (state == 1) fill(0);
    else if (previous == 1 && state == 0) fill(255,0,0);
    else fill(255); 
    stroke(0);
    rect(x, y, w, w);
  }
  
  
}
