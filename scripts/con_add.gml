///con_add(string)
//show_debug_message(argument0);
var f = file_text_open_append("db.txt");
file_text_write_string(f,argument0);
file_text_writeln(f);
file_text_close(f);
