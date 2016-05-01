///ui_Text(x,y,text,colour,halign,valign,size)


var x1 = argument [ 0 ];
var y1 = argument [ 1 ];
var fnt = fnt_arial;
switch (argument[6])
{
case 0 : fnt = fnt_debug;break;
case 1 : fnt = fnt_arial ;break;
case 2 : fnt = fnt_large;break;
}
draw_set_font(fnt);


draw_set_halign(argument[4]);
draw_set_valign(argument[5]);

draw_set_colour(argument[3]);
draw_text(x1,y1,argument[2]);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
