///scr_GlobalSettingInit()

globalvar GMSetting;

GMSetting = ds_map_create();

GMSetting[? "debug"] = false; //whether debug mode is on
GMSetting[? "Networking"] = false; //networking on? 
GMSetting[? "AppSurface"] = true; //Application surface on/off
GMSetting[? "G-Shadows"] = ds_map_find_value(global.Engine_Settings,"g-Preshadows");  //Pre compiled shadows ?
GMSetting[? "G-RShadow"] = ds_map_find_value(global.Engine_Settings,"g-RTShadows"); ; //Realtime shadows?
GMSetting[? "G-Level"] = ds_map_find_value(global.Engine_Settings,"g-level")
;  //Graphics level 0 for extremely low
GMSetting[? "G-PSurf"] =ds_map_find_value(global.Engine_Settings,"g-PreLights") //Pre rendered light surfaced



if (ds_map_find_value(global.Engine_Settings,"g-level") == 0){
GMSetting[? "G-PSurf"] = false;
}

// 1 - low
// 2 - med
// 3 - high
// 4 - extremely heigh
GMSetting[? "CollRes"] = 1; //Collision resolution small  == smooth == low performance
