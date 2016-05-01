///scr_firsttime(argument0)
//if game is started first time in device/pc

if (file_exists(argument0+"game.ini"))
{
ini_open(argument0+"game.ini");
var ver = ini_read_real("Inf","version",0);
var build = ini_read_real("Inf","Build",0);
ini_close();
if (build==game_build)
   {
   return true;
   }

}

ini_open(argument0+"game.ini");
ini_write_real("Inf", "version", game_ver);
ini_write_real("Inf", "Build", game_build);
ini_write_string("Inf", "ver", "TR_"+string(game_ver)+"_B"+string(game_build));
ini_write_real("Graphics", "Preshadows", true);
ini_write_real("Graphics", "PreLights", true);
ini_write_real("Graphics", "AmbDark",   0.6);
ini_write_real("Graphics", "LightsAlpha", 0.1);
ini_write_real("Graphics", "Blood", true);
ini_write_real("Graphics", "Blood_Fade", false);
ini_write_real("Graphics", "flash",true );
ini_write_real("Graphics", "RTShadows", true);
ini_write_real("Graphics", "Casing",true );
ini_write_real("Graphics", "ChrShadows",true );
ini_close()

return true;
