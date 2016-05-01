///scr_shoot(x,y,direction,shooter,team,dmg)
var temp_dir = argument2;
var temp_x = argument0;
var temp_y = argument1;
var start_x = temp_x;
var start_y = temp_y;


    var collbox = position_meeting(temp_x,temp_y,o_CollisionBox);
    var col_ai =  position_meeting(temp_x,temp_y,obj_unit_par);

    var instpos = instance_position(temp_x,temp_y,obj_unit_par)

   
    if (instpos!=noone)
    if (instpos.team==argument4) col_ai = false;
   
    var collision = collbox || col_ai;


while (!collision and distance_to_point(start_x,start_y)<room_width)
      {
      temp_x += lengthdir_x(4,temp_dir);
      temp_y += lengthdir_y(4,temp_dir);
       collbox = position_meeting(temp_x,temp_y,o_CollisionBox);
       col_ai =  position_meeting(temp_x,temp_y,obj_unit_par);
    var instpos = instance_position(temp_x,temp_y,obj_unit_par);

    if (instpos!=noone)
    if (instpos.team==argument4) col_ai = false;
       collision = collbox || col_ai;
      
      }
var i = instance_create(temp_x,temp_y,o_shot);

i.shooter = argument3;
i.team = argument4;
i.dmg = argument5;
i.start_x = start_x;
i.start_y = start_y;
return i;
 


