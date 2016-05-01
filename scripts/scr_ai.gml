var var1, var2, var3
{
//Find a target
if instance_exists(target) == 0
    target = -1
if instance_number(obj_unit_par) == 0
    exit
if random(1) < 0.1
    {
    if target == -1
        {
        var1 = 0
        var2 = instance_number(obj_unit_par)
        while var1 < var2
            {
            var1 += 1
            var3 = instance_nth_nearest(x,y,obj_unit_par,var1)
            if var3.team != team
                {
                if point_distance(x,y,var3.x,var3.y) > 480
                    break
                else
                    target = var3
                break
                }
            }
        }
    else
        {
        if collision_line(x,y,target.x,target.y,o_CollisionBox,0,0) > 0
            {
            var1 = 0
            var2 = instance_number(obj_unit_par)
            while var1 < var2
                {
                var1 += 1
                var3 = instance_nth_nearest(x,y,obj_unit_par,var1)
                if var3.team != team && collision_line(x,y,var3.x,var3.y,o_CollisionBox,0,0) < 0
                    {
                    if point_distance(x,y,var3.x,var3.y) > view_wview[0]
                        break
                    else
                        target = var3
                    break
                    }
                }
            }
        }
    }
if target != -1
    {
    //Shoot; replace this code with whatever you need for to create bullets and mayhem and stuff
    //This code uses spd and dir variables within to target so as to lead the target when shooting
    image_angle = (image_angle+(sin(degtorad((point_direction(x,y,target.x+lengthdir_x(target.spd*point_distance(x,y,target.x,target.y)*0.1,target.dir),target.y+lengthdir_y(target.spd*point_distance(x,y,target.x,target.y)*0.1,target.dir)))-image_angle))*12));
    if collision_line(x,y,target.x,target.y,o_CollisionBox,0,0) <= 0 and can_shoot //alarm[0] == -1
        {
       scr_shoot(x+lengthdir_x(wp_data[# wp_id,12],image_angle),y+lengthdir_y(wp_data[# wp_id,12],image_angle),image_angle+random_range(-(wp_data[# wp_id,5]),wp_data[# wp_id,5]),id,team, wp_data[# wp_id,7])
       can_shoot = false;
        alarm[0] = ((room_speed*60)/wp_data[# wp_id,6]);
        var snd;
        snd = wp_data[# wp_id,2];
        audio_play_sound_at(snd,x,y,0,100,1000,1,0,0);
        if (ds_map_find_value(global.Engine_Settings,"g-flash")){
        var i = instance_create(x + lengthdir_x(wp_data[# wp_id,12], image_angle),y + lengthdir_y(wp_data[# wp_id,12], image_angle),o_flash);
            i.image_angle = image_angle; i.image_index = team; i.creater = id; i.const = wp_data[# wp_id,12];
        }
        with (instance_create(x + lengthdir_x(28, image_angle), y + lengthdir_y(28, image_angle), obj_Casing))
            {
            image_index = 0;
            direction = (other.image_angle + 90) - 15 + random(30);
            image_angle = direction - 90;
            }
        }
    //Is target dead?
    if instance_exists(target) == 0
        {
        target = -1
        exit
        }
if (os_type != os_android) //donot dodge bullets if we are on android
{
//Dodge bullets

    var1 = 0
    var2 = instance_number(o_Bullet)
    while var1 < var2
        {
        var1 += 1
        var3 = instance_nth_nearest(x,y,o_Bullet,var1)
        if point_distance(x,y,var3.x,var3.y) > 192
            var1 = var2+1;
        else if var3.team != team
            {
            mp_potential_step_object(x+lengthdir_x(64*sign(angle_difference(point_direction(var3.x,var3.y,x,y),var3.direction)),point_direction(var3.x,var3.y,x,y)+90),y+lengthdir_y(64*sign(angle_difference(point_direction(var3.x,var3.y,x,y),var3.direction)),point_direction(var3.x,var3.y,x,y)+90),6,o_CollisionBox)
            exit;
            }
        }
        }
//    if hp >= target.hp/2 || hp > 50
        {
        //Move to the target, and stay within a certain distance whilst maintaining a buffer
        if point_distance(x,y,target.x,target.y) > 256 || collision_line(x,y,target.x,target.y,o_CollisionBox,0,0) > 0
            mp_potential_step_object(target.x,target.y,6,o_CollisionBox)
        if point_distance(x,y,target.x,target.y) < 128 && collision_line(x,y,target.x,target.y,o_CollisionBox,0,0) < 0
            mp_potential_step_object(target.x,target.y,-6,o_CollisionBox)
        }
//    else
//        {
//        //Move away from the target, and try and get behind some cover
//        var1 = instance_nearest(x,y,o_CollisionBox)
//        var2 = point_direction(target.x,target.y,var1.x+16,var1.y+16)
//        mp_potential_step_object(var1.x+lengthdir_x(32,var2),var1.y+lengthdir_y(32,var2),6,o_CollisionBox)
//        }
    }
else
    {
    //Search around the world if bored and lonely to find a new target
    mp_potential_step_object(searchx,searchy,6,o_CollisionBox)
    image_angle = (image_angle+(sin(degtorad(point_direction(xprevious,yprevious,x,y)-image_angle))*12))
    if point_distance(x,y,searchx,searchy) < 120 && random(120) < 1
        {
        searchx = random(room_width)
        searchy = random(room_height)
        }
    }
}
