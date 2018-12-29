Population test;
PVector goal = new PVector(400,10);
PVector A = new PVector(200,200);
PVector B = new PVector(200,100);
PVector C = new PVector(210,300);
PVector D = new PVector(100,350);
PVector E = new PVector(110,800);
PVector F = new PVector(600,360);
PVector G = new PVector(590,460);
PVector H = new PVector(400,500);
PVector I = new PVector(800,210);
PVector J = new PVector(410,800);

Wall wall = new Wall(A,I);
Wall wall2 = new Wall(B,C);
Wall wall3 = new Wall(D,F);
Wall wall4 = new Wall(D,E);
Wall wall5 = new Wall(F,G);
Wall wall6 = new Wall(H,J);




void setup() {
 size(800,800);
 
 test = new Population(6000,6);
  test.addWall(wall);
  test.addWall(wall2);
test.addWall(wall3);
  test.addWall(wall4);
  test.addWall(wall5);
test.addWall(wall6);
wall.setDensity(2);
wall2.setDensity(1.0);
wall3.setDensity(64);
wall4.setDensity(64);
wall5.setDensity(32);
wall6.setDensity(64);
}
void draw(){
 background(255) ;
 fill(250,0,0);
 ellipse(goal.x,goal.y,10,10);
 
 //fill(0,0,255);
 
 if(test.AllAreDead()){
   test.calculateFitness();
   test.naturalSelection();
   test.mutateThemBabies();
   
 }

  test.update();
  test.show();
  
}
