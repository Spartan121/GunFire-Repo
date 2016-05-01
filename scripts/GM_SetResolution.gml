///GM_SetResolution()

{
con_add("Surface:"+string(application_surface_is_enabled()));
//application_surface_enable(true);
display_w = round(display_get_width());
display_h = round(display_get_height());
con_add("d:"+string(display_w)+","+string(display_h));
views_aspect_ratio = view_wview[0] / view_hview[0];
display_aspect_ratio = display_w / display_h;
// If we have to enlarge vertically
if views_aspect_ratio < display_aspect_ratio {
    view_hview[0] = round(view_wview[0] / display_aspect_ratio )
    view_hport[0] = round(view_wview[0] / display_aspect_ratio )
    surface_resize(application_surface, view_wview[0], view_hview[0]);
}// Else we have to enlarge horizontally
else if views_aspect_ratio > display_aspect_ratio 
{
    view_wview[0] = round(view_hview[0] / display_aspect_ratio);
    view_wport[0] = round(view_hview[0] / display_aspect_ratio)
    surface_resize(application_surface,view_wview[0], view_hview[0]);
}
con_add("view:"+string(view_wview)+","+string(view_hview)+" port:"+string(view_wport)+","+string(view_hport));
display_set_gui_size(view_wview[0],view_hview[0]);

      
con_add("APPSURFACE SIZE:"+string(surface_get_width(application_surface))+","+string(surface_get_height(application_surface)));

//application_surface_enable(false);

}

