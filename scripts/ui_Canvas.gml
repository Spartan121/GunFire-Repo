///ui_Canvas(x,y,width,height,alpha)

var x1 = argument [ 0 ];
var y1 = argument [ 1 ];
var x2 = x1 + argument [ 2 ];
var y2 = y1 + argument [ 3 ];
draw_set_alpha(argument [ 4 ]);
//draw_set_colour(merge_colour(c_black,c_gray,0.3));
//draw_rectangle(x1,y1,x2,y2,0);
//draw_set_colour(c_black)
draw_sprite_stretched(s_gui_canvas,0,x1,y1,x2-x1,y2-y1);
//draw_rectangle(x1,y1,x2,y2,1);
draw_set_alpha(1);
