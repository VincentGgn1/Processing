class Dot{
 PVector pos;
 PVector vel;
 PVector acc;
  Brain brain;
 boolean dead = false;
boolean reachedGoal = false;
float fitness = 0;
boolean isBest = false;
float wallTouched;

Dot(){
 pos = new PVector(width/2,height-10);
 vel =  new PVector(0,0);
 acc = new PVector(0,0);
brain = new Brain(4000);
  
  }

void show() {
  if(isBest)
  {
   fill(0,255,0);
    ellipse(pos.x,pos.y,8,8);
  }else
   {
  
  
  fill(0);
  ellipse(pos.x,pos.y,4,4);
   }
}

void move() {
  if(brain.step < brain.directions.length){
  acc = brain.directions[brain.step];
  brain.step++;
  }else{
    
    dead=true;
  }
 
 pos.add(vel);
 vel.add(acc);
 vel.limit(200);
  
}

void update (){
  
  if(!dead && !reachedGoal) {
 move();
 if (pos.x < 2 || pos.y <2 || pos.x > (width-2) || pos.y > height -2 ){
  dead = true; 
   
 }else if (dist(pos.x,pos.y,goal.x,goal.y)<5){
   reachedGoal = true; 
  }
 
  }
}


void calculateFitness(){
  
  if (reachedGoal){
   fitness =1+ 1/(float)(brain.step*brain.step); 
  }
  else {
 float distanceToGoal = dist(pos.x,pos.y,goal.x,goal.y); 
  fitness = 1/ (distanceToGoal*distanceToGoal);

  }
  if(wallTouched!=0){
   fitness = fitness/wallTouched; 
  }
}

void mutate () {
 brain.mutate(); 
}


Dot gimmeBaby(){
 Dot baby = new Dot(); 
  baby.brain = brain.clone();
  return baby;
  
}


}


//----------------------
