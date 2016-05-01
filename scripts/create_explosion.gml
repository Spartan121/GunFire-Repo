///create_explosion(x,y)

var xx = argument0;
var yy = argument1;

repeat (10)
       {
       
       instance_create(xx-16+random(32),yy-16+random(32),o_e_explosion_piece);
       
       }
       
part_particles_create(o_e_particle.system,xx,yy,o_e_particle.ex_center_part,2);
