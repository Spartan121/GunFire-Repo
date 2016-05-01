///Map_Import(dir)
room_tile_clear(rm_temp);


map = buffer_load(argument0);

header = buffer_read(map,buffer_string);
code = buffer_read(map,buffer_s32);


map_width = buffer_read(map,buffer_s32);
map_height = buffer_read(map,buffer_s32);
show_debug_message(string(map_width)+","+string(map_height));
room_set_width(rm_temp,map_width);
room_set_height(rm_temp,map_height);

repeat (3)
buffer_read(map,buffer_s32);

map_name = buffer_read(map,buffer_string);


repeat (4)
buffer_read(map,buffer_string);

//objects
total_objects = buffer_read(map,buffer_u32);
show_debug_message("TotalO:"+string(total_objects));
for ( var i = 0; i<total_objects ; i++)
    {
    type = buffer_read(map,buffer_string);
    
    _x = buffer_read(map,buffer_s32);
    _y = buffer_read(map,buffer_s32);
    _depth = buffer_read(map,buffer_s32);
    blend = buffer_read(map,buffer_s32);
    alpha = buffer_read(map,buffer_s32);
    angle = buffer_read(map,buffer_s32);
    repeat (9)
    buffer_read(map,buffer_s32);
    repeat (5)
    buffer_read(map,buffer_string);

    switch (type)
        {
        case "CTSpawn" : room_instance_add(rm_temp,_x,_y,o_ct_spawn);break;
        case "TSpawn" : room_instance_add(rm_temp,_x,_y,o_t_spawn);break;
        case "Explosive" : room_instance_add(rm_temp,_x,_y,o_Explosive_Spawn);break;
        case "RM" : room_instance_add(rm_temp,_x,_y,o_e_Room);
        }
    }
total_tiles = buffer_read(map ,buffer_u32);
show_debug_message("TotalTiles:"+string(total_tiles));
for ( var i = 0; i<total_tiles;i++)
    {
    tl_no = buffer_read(map,buffer_s32);    
    left = buffer_read(map,buffer_s32);  
    top = buffer_read(map,buffer_s32);  
    width = buffer_read(map,buffer_s32);  
    height = buffer_read(map,buffer_s32);  
    _x = buffer_read(map,buffer_s32);  
    _y =buffer_read(map,buffer_s32);  
    _depth = buffer_read(map,buffer_s32);  
    blend = buffer_read(map,buffer_s32);  
    xscale = buffer_read(map,buffer_s32);  
    yscale = buffer_read(map,buffer_s32);  
    alpha = buffer_read(map,buffer_s32)/100;
    repeat (3)
    buffer_read(map,buffer_s32);
//room_tile_add_ext(rm_temp,background4,left,top,width,height,_x,_y,_depth,xscale,yscale,alpha);
}
///End

buffer_delete(map);

room_goto(rm_temp);
