int parsCount=0;
int max=10;
int map[][]=new int[max][max];

void setup()
{
 //size(500,500);
 background(75,25,90);
 
}
void draw()
{
  loadGame();
  int mSize=map.length;
  int reSize=height/mSize;
  for (int i = 0; i < map.length; i++)  
  {
    for (int j = 0; j < map.length; j++)
    {
     if(map[j][i]==1)
     {
       fill(100);rect(i*reSize,j*reSize,reSize,reSize);
     }
     if(map[j][i]==2)
     {
       fill(0);rect(i*reSize,j*reSize,reSize,reSize);
     }
     if(map[j][i]==3)
     {
       fill(200);rect(i*reSize,j*reSize,reSize,reSize);
     }
    }
  }
}
void keyPressed()
{
  if(keyCode==TAB);
  {saveGame();}
}

void saveGame()
{
  try
  {
    //use a PrintWriter to send your information to a chosen file
    PrintWriter pw = createWriter("save.txt");
    for(int i=0;i<map.length;i++)
  {
   for(int j=0;j<map.length;j++)
   {
     pw.print(map[i][j]+" ");
   }
   pw.println();
  }
  pw.flush(); //Writes the remaining data to the file
  pw.close(); //Finishes the file
  }
  catch(Exception e)
  {
    println("SOMETHING WENT WRONG");
  }
}
//Loads the game
void loadGame()
{  
 try
 {
  String[] data = loadStrings("save.txt");//use the loadStrings() method to pull the lines of your save file into a String array //<>//
  
  for(int i=0;i<data.length;i++)
  {
   for(int j=0;j<data[i].length();j+=2)
   {
    if( ((int)(data[i].charAt(j)-('0'))>0) )
    {
     map[i][parsCount]=(int)(data[i].charAt(j)-('0'));
    }
    else
    {
     map[i][parsCount]=(int)(random(4));//if the value is 0 or nothing fill the value with 1
    }
    parsCount++;
   }
   parsCount=0;
  }
  saveGame();
 } //<>//
 catch(Exception e)
 {
  println("SOMETHING WENT WRONG");
  //Loads default data
  for(int i=0;i>map.length;i++)
  {
   for(int j=0;j>map.length;j++)
   {
    map[i][j]=(int)(random(3));
   }
  }
  saveGame();
  exit();
 }
}
