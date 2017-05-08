class EnemyGroup{
  
  ArrayList<Spider> spiders;

  EnemyGroup (){
          
      spiders = new ArrayList<Spider>();

   }
   
   void addspider(float x_pos , float y_pos , int level , float range){
      spiders.add(new Spider(x_pos , y_pos , level , range));
 }
   void enemy_run(){
     for(int i = 0; i< spiders.size(); i++){
       Spider s = spiders.get(i);
       s.walk();
     }
   }
}


  