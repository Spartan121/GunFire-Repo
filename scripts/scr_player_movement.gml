///scr_player_movement(speed)
if (os_type == os_windows){

image_angle = point_direction(x,y,mouse_x,mouse_y);




up = keyboard_check(vk_up) || keyboard_check(ord("W"));
down = keyboard_check(vk_down) || keyboard_check(ord("S"));
left = keyboard_check(vk_left) || keyboard_check(ord("A"));
right = keyboard_check(vk_right) || keyboard_check(ord("D"));

if (up && left){
direction = 135;
speed +=1 ;
}
else
if (up && right){
direction = 45;
speed +=1 ;
}
else
if (down && left){
direction = 225;
speed +=1 ;
}
else
if (down && right){
direction = 315;
speed +=1 ;
}
else
if (up){
direction = 90;
speed +=1;
}
else
if (down){
direction = 270;
speed +=1;
}
else
if (left){
direction = 180;
speed +=1;
}
else
if (right){
direction = 0;
speed +=1;
}
else
speed --;

speed *=DeltaTime();
speed = clamp(speed,0,mov_spd*DeltaTime());

}
if (os_type == os_android)
{
stick_x[0] = gui_x[0];
stick_y[0] = gui_y[0];
if (st_pressed[0] == -1)
    {
    for (var i = 0; i< 5;i++)
        {
        var tx,ty;
        tx = scr_mouse_gui_x(device_mouse_raw_x(i));
        ty = scr_mouse_gui_y(device_mouse_raw_y(i));
        
        if (point_distance(tx,ty,gui_x[0],gui_y[0]) < st_radius)
            {
            if (st_pressed[1] !=i)
                {
                st_pressed[0] = i;
                break;
                }
            }
        }
    }
if (device_mouse_check_button(st_pressed[0],mb_left))
{
var spd,vdist,mx,my;
mx = scr_mouse_gui_x(device_mouse_raw_x(st_pressed[0]));
my = scr_mouse_gui_y(device_mouse_raw_y(st_pressed[0]));
vdist = min(st_radius,point_distance(mx,my,gui_x[0],gui_y[0]));
vdir = point_direction(gui_x[0], gui_y[0], mx, my);
spd = min(10,vdist/5);
hspeed = lengthdir_x(spd,vdir)*DeltaTime();
vspeed = lengthdir_y(spd,vdir)*DeltaTime();
stick_x[0] = gui_x[0] + lengthdir_x(vdist,vdir);
stick_y[0] = gui_y[0] + lengthdir_y(vdist,vdir);
}
else{
st_pressed[0] = -1;
speed = 0;
}

///

stick_x[1] = gui_x[1];
stick_y[1] = gui_y[1];
 if (st_pressed[1] == -1)
    {
    for (var i = 0; i < 5; i++;)
       {
       if device_mouse_check_button(i, mb_left)
          {
          var tx, ty;
          tx = scr_mouse_gui_x(device_mouse_raw_x(i));
          ty = scr_mouse_gui_y(device_mouse_raw_y(i));
          if point_distance(tx, ty, gui_x[1], gui_y[1]) < st_radius
             {
             if (st_pressed[0] != i  )             {
                st_pressed[1] = i;
                break;
                }             }
          }
       }
    }
 if device_mouse_check_button(st_pressed[1], mb_left)
    {
    var mx, my;
    mx = scr_mouse_gui_x(device_mouse_raw_x(st_pressed[1]));
    my = scr_mouse_gui_y(device_mouse_raw_y(st_pressed[1]));
    vdist = min(st_radius, point_distance(mx, my, gui_x[1], gui_y[1]));
    vdir = point_direction(gui_x[1], gui_y[1], mx, my);
    stick_x[1] = gui_x[1] + lengthdir_x(vdist, vdir);
    stick_y[1] = gui_y[1] + lengthdir_y(vdist, vdir);
 
  image_angle = vdir; 
    if (can_shoot and point_distance(gui_x[1],gui_y[1],gui_x[1]+lengthdir_x(vdist, vdir),gui_y[1]+lengthdir_y(vdist, vdir))>(st_radius/1.5))
    {
     scr_player_shoot();
    }
    }
 else{
 st_pressed[1] = -1;
 }

for (var i = 0; i< 5;i++)
{
if (st_pressed[0] != i or st_pressed[1] !=i)
    {
    if (device_mouse_check_button(i,mb_left))
    {
    if ( point_distance(round_button_x[0],round_button_y[0],scr_mouse_gui_x(device_mouse_raw_x(i)),scr_mouse_gui_y(device_mouse_raw_y(i)))<round_button_radius)
        {
        if (g_shoot and g_timer < 80)
        g_timer += 1;
        break;
        }
    }
    
    if (device_mouse_check_button_released(i,mb_left))
//    if ( point_distance(round_button_x[0],round_button_y[0],scr_mouse_gui_x(device_mouse_raw_x(i)),scr_mouse_gui_y(device_mouse_raw_y(i)))<round_button_radius)
        if (g_timer>1)
        {
            if g_shoot
            {
            with (instance_create(x, y, obj_Player_Granade))
                {
                direction = other.image_angle + 10 - random(20);
                speed = min(20, other.g_timer);
                spd = speed;
                }
            g_shoot = false;
            g_timer = 1;
            alarm[1] = room_speed * 3;
            }
            break;
        }
    }



}
}
