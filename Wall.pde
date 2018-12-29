class Wall{
/*
A-----B
|     |
D-----C
*/
  PVector A;
  PVector B;
  PVector C;
  PVector D;
  float density=0;
  
  Wall(PVector TopLeft, PVector BottomRight)
  {
   A = TopLeft.copy(); 
   D = new PVector(TopLeft.x,BottomRight.y);
   C = BottomRight.copy();
   B = new PVector(BottomRight.x,TopLeft.y);
  }
  void setDensity(float dens){
    
   density = dens; 
  }
  void show(){
     fill(0,0,255);
 rect(A.x,A.y,C.x-A.x,C.y-A.y);
  }
  
  
  
  boolean hasColided( PVector dot)
  {
   
  
  return dot.x > A.x && dot.x < C.x && dot.y <C.y && dot.y>A.y;
  
  }
  boolean willColide(PVector pos, PVector vel)
  {
    PVector posn1 = pos.copy();
  //to prevent the dot from going through the walls 
  if( pos.x > A.x && pos.x < C.x ){
   // the dote is in the abcisse range of the wall 
   if(pos.y >C.y && posn1.add(vel).y < A.y)
   {
     
     return true;
   }
   if(pos.y <A.y && posn1.add(vel).y > C.y)
   {
     return true;
   }    
  }
    if( pos.y <C.y && pos.y>A.y ){
   // the dote is in the abcisse range of the wall 
   if(pos.x >C.x && posn1.add(vel).x < A.x)
   {
     return true;
   }
   if(pos.x <A.x && posn1.add(vel).x > C.x)
   {
     return true;
   }    
  }
  return false;
  }
  
}
