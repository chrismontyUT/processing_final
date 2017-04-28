class EnemyGroup{
  
  ArrayList<Spider> spider_group;

  EnemyGroup (){
          
      spider_group = new ArrayList<Spider>();

   }
   
   void addspider(float x_pos , float y_pos , float level , float range){
      spider_group.add(new Spider(x_pos , y_pos , level , range));
 }
   void enemy_run(){
     for(int i = 0; i< spider_group.size(); i++){
       Spider s = spider_group.get(i);
       s.walk();
     }
   }
}


  