///scr_slide_move(inst,res)
//THIS CAN GO IN THE END STEP OF THE INSTANCE
//OR THE COLLISION EVENT WITH AN INSTANCE
//
//scr_move_slide(inst, res);
//
//argument0 = instance to check for
//argument1 = resolution. Must be between 1 and 45 (low numbers are SLOW). 15 is a good default


var xmot, ymot;
x=xprevious;
y=yprevious;
for (i = 0; i < 90; i += argument1)
    {
    xmot = x + lengthdir_x(speed, direction + i);
    ymot = y + lengthdir_y(speed, direction + i);
    if !place_meeting(xmot, ymot,argument0) {x = xmot; y = ymot; exit;}
    xmot = x + lengthdir_x(speed, direction - i);
    ymot = y + lengthdir_y(speed, direction - i);
    if !place_meeting(xmot, ymot, argument0) {x = xmot; y = ymot; exit;}
    }
