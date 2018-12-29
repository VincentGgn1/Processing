class Population{
 Dot[] dots;
 
 Maze maze;

 float fitnessSum=0;
 int bestDot = 0;
 int minSteps = 400;
 int gen=0;
 Population( int size, int mazeSize) {
  dots = new Dot[size]; 
   for (int i = 0 ; i < size ;  i++ ) 
   {
    dots[i]= new Dot();  
   }
   maze = new Maze(mazeSize);
   //trap = new Wall(wall.A,wall.C);
 }
  
  void addWall(Wall wall){
    
    maze.addWall(wall);
    
  }
  
  
  void show ()
  {
   for (int i = 0 ; i < dots.length ;  i++ ) 
   {
    dots[i].show(); 
   }
    maze.show();
  }
  
  
    void update ()
  {
   for (int i = 0 ; i < dots.length ;  i++ ) 
   {
     
     if (dots[i].brain.step > minSteps){
      dots[i].dead= true; 
     }else if (!maze.collisionHandling(dots[i])){
       
    dots[i].update(); 
     }  else{
     dots[i].dead= true; 
     
     }
 }
    
  }
  
  
    
    void calculateFitness ()
  {
   for (int i = 0 ; i < dots.length ;  i++ ) 
   {
    dots[i].calculateFitness(); 
   }
    
  }
  
Boolean AllAreDead(){
     for (int i = 0 ; i < dots.length ;  i++ ) 
   {
    if(!dots[i].dead  && !dots[i].reachedGoal)
    {
      return false;
    }
    
   }
    return true;
  
}

void naturalSelection(){
  Dot[] newDots = new Dot[dots.length];
  setBestDot();
  calculateFitnessSum();
  newDots[0] = dots[bestDot].gimmeBaby();
  newDots[0].isBest = true;
  for (int i = 1 ; i < dots.length ;  i++ ) 
  {
   // select parents based on fitness 
    Dot parent = selectParents();
    
    
    newDots[i] = parent.gimmeBaby();
    
  }
  dots = newDots.clone();
  
  gen ++;
}

void calculateFitnessSum()
{
  fitnessSum=0;
    for (int i = 0 ; i < dots.length ;  i++ ) 
  {
    fitnessSum+= dots[i].fitness;
  }
  
}

Dot selectParents()
{
  float rand = random(fitnessSum);
  float runningSum = 0;
      for (int i = 0 ; i < dots.length ;  i++ ) 
  {
   
    
    runningSum+= dots[i].fitness;
   if (rand < runningSum){
    return dots[i]; 
   }
    
  }
  
  return null ; 
  
  
}

void mutateThemBabies() {
  //0 position is previous best so we do not mutate it 
        for (int i = 1 ; i < dots.length ;  i++ ) 
  {
    dots[i].mutate();
  }
  
  
  
}

void setBestDot(){
  
  float max = 0;
  int maxIndex=0;
  for (int i = 0 ; i < dots.length ;  i++ ) 
  {
   if(dots[i].fitness > max )
   {
     max = dots[i].fitness;
     maxIndex = i ; 
    
   }
     
  }
  bestDot = maxIndex;
  if(dots[bestDot].reachedGoal)
  {
   minSteps = dots[bestDot].brain.step; 
  }
  
  
  
}






}
