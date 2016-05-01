///ui_PushButton_ext(x,y,width,height,text,sprite,txtcolor,fnt,back,bck_clr,disp,outline)

var x1 = argument [ 0 ];
var y1 = argument [ 1 ];
var x2 = x1 + argument [ 2 ];
var y2 = y1 + argument [ 3 ];

draw_set_font(argument[7]);
//draw_rectangle(x1,y1,x2,y2,0)
var img = 0;
mousein = point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),x1,y1,x2,y2)

if (mousein or (mousein and device_mouse_check_button(0,mb_left)))
img=1;
else
img =0;
if (argument[10] and argument[8])
{
if (mousein)
   {
   draw_set_colour(argument[9]);
   draw_rectangle(argument[0],argument[1],argument[0]+argument[2],argument[1]+argument[3],argument[11]);
   }
}
else
if (argument[8])
   {
   draw_set_colour(argument[9]);
   draw_rectangle(argument[0],argument[1],argument[0]+argument[2],argument[1]+argument[3],argument[11]);   
   }

if (sprite_exists(argument[5]))
draw_sprite_stretched(s_gui_button,img,x1,y1,x2-x1,y2-y1);

draw_set_colour(c_white);
//draw_rectangle(x1,y1,x2,y2,1)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(argument[6]);
draw_text(x1+(argument[2]/2),y1+(argument[3]/2),argument[4]);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (mouse_check_button_released(mb_left))
if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),x1,y1,x2,y2))
{
return true;
}
else
return false;
