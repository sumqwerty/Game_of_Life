class Game_of_Life
{
  int w = charSize;
  int columns,rows;
  int[][] board;
  char charTodisp;
  //Cell[][] board;
  Img img;
  
  Game_of_Life()
  {
    columns = width/w;
    rows = height/w;
    img = new Img();
    board = new int[columns][rows];
    //board = new Cell[columns][rows];
    init();
  }
  
  void init()
  {
    for(int i = 1; i<columns-1; ++i)
    {
      for(int j = 1; j<rows-1; ++j)
      {
        //board[i][j] = new Cell(i*w, j*w, w);
        board[i][j] = int(random(2));
      }
    }
  }
  
  void generateWrp() 
  {

    int[][] next = new int[columns][rows];

    // Loop through every spot in our 2D array and check spots neighbors
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {

        // Add up all the states in a 3x3 surrounding grid
        int neighbors = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            neighbors += board[(x+i+columns)%columns][(y+j+rows)%rows];
          }
        }

        // A little trick to subtract the current cell's state since
        // we added it in the above loop
        neighbors -= board[x][y];

        // Rules of Life
        next[x][y] = rules(x,y,neighbors);
      }
    }

    // Next is now our board
    board = next;
    
  }
  
  
  void generate()
  {
    int[][] next = new int[columns][rows];
    
    for(int x = 1; x<columns-1; ++x)
    {
      for(int y = 1; y<rows-1; ++y)
      {
        int neighbors = 0;
        
        for(int i = -1; i<=1; ++i)
        {
          for(int j = -1; j<=1; ++j)
          {
            neighbors += board[x+i][y+j];
          }
        }
        
        neighbors -= board[x][y];
        
        next[x][y] = rules(x,y,neighbors);
        
      }
    }
    
    board = next;
    
  }
  
  int rules(int x, int y, int neighbors)
  {
    if      ((board[x][y] == 1) && (neighbors <  2)) return 1;           // Loneliness
    //if      ((board[x][y] == 1) && (neighbors <  2)) return 0;
    else if ((board[x][y] == 1) && (neighbors >  3)) return 0;           // Overpopulation
    else if ((board[x][y] == 0) && (neighbors == 3)) return 1;           // Reproduction
    else    return board[x][y];
  }
  
  
  void disp()
  {
    for ( int i = 0; i < columns;i++) 
    {
      for ( int j = 0; j < rows;j++) 
      {
        if ((board[i][j] == 1))
        {
          //fill(0,255,0);
          //fill(random(0,255),random(0,255),random(0,255));
          fill(img.returnColor(i*w,j*w));
          //circle(i*w,j*w,w);
          int xpos = i*w;
          int ypos = j*w;
          //xpos -= (width/2);
          //ypos -= (height/2);
          //charTodisp = charset[int(random(charset.length))];
          //text(charTodisp,xpos,ypos);
          //noFill();
          rect(xpos, ypos, w, w);
          //fill(img.returnColor(i*w,j*w));
          //fill(random(0,255),random(0,255),random(0,255));
          //rect(xpos+2,ypos+2,w-4,w-4);
        }
      }
    }
        noStroke();
        //else fill(255); 
        //stroke(0);
        
  }
  
}
