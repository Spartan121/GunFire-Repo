//var i = instance_create(x+lengthdir_x(wp_data[# wp_id,12],image_angle),y+lengthdir_y(wp_data[# wp_id,12],image_angle),obj_new_Bullet);
   // i.speed = 80+random(3);
//    i.team = team;
    
    //var rnd = speed/1.5;
//    i.dir  = image_angle+random_range(-wp_data[# wp_id,5],wp_data[# wp_id,5]);
 //   i.image_angle = i.direction;
//    i.dmg = wp_data[# wp_id,7];
//    i.shooter = id;
shooting = true;
scr_shoot(x+lengthdir_x(wp_data[# wp_id,12],image_angle),y+lengthdir_y(wp_data[# wp_id,12],image_angle),image_angle+random_range(-wp_data[# wp_id,5],wp_data[# wp_id,5]),id,team, wp_data[# wp_id,7])
audio_play_sound_at(wp_data[# wp_id,2],x,y,0,100,1000,1,0,0); 
can_shoot = false;
//o_x = x;
//o_y = y;
/*if (!instance_place(x+lengthdir_x(-3,image_angle),y+lengthdir_y(-3,image_angle),o_CollisionBox)){
x = x+lengthdir_x(-3,image_angle);
y = y+lengthdir_y(-3,image_angle);
}*/
alarm[0] = ((room_speed*60)/wp_data[# wp_id,6]) //Next bullet timer
if (ds_map_find_value(global.Engine_Settings,"g-flash")){
var i = instance_create(x + lengthdir_x(wp_data[# wp_id,12], image_angle),y + lengthdir_y(wp_data[# wp_id,12], image_angle),o_flash);
i.image_angle = image_angle; i.image_index = team;
i.creater = id;
i.const = wp_data[# wp_id,12];      
}

with (instance_create(x + lengthdir_x(28, image_angle), y + lengthdir_y(28, image_angle), obj_Casing))
{
image_index = 0;
direction = (other.image_angle + 90) - 15 + random(30);
image_angle = direction - 90;
}

alarm[3] = 1;
