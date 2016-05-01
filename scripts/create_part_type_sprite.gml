///create_part_type_sprite(sprite,blend,minlife,maxlife,minscale,maxscale,scaling)

var type = part_type_create();

part_type_alpha2(type,.75,0);
part_type_sprite(type,argument0,0,true,0);
part_type_blend(type,argument1);
part_type_size(type,argument4,argument5,argument6,0);
part_type_life(type,argument2,argument3);
part_type_orientation(type,0,360,false,false,false);

return type;

