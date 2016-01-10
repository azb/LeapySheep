///MELT_scr_gui_add(x,y,w,h,type)

//object properties
global.GUI_x[global.GUIs] = argument0
global.GUI_y[global.GUIs] = argument1
global.GUI_w[global.GUIs] = argument2
global.GUI_h[global.GUIs] = argument3
global.GUI_type[global.GUIs] = argument4
global.GUI_text[global.GUIs] = string_replace(argument4,"gui_","")
global.GUI_input_text[global.GUIs] = ""
global.GUI_deleted[global.GUIs] = 0
global.GUI_spr[global.GUIs] = -1
global.GUI_script[global.GUIs] = -1
global.GUI_depth[global.GUIs] = 0
global.GUI_gotopage[global.GUIs] = -1
global.GUI_page[global.GUIs] = page
global.GUI_is_password[global.GUIs] = 0
global.GUI_halign[global.GUIs] = fa_center
global.GUI_valign[global.GUIs] = fa_center

global.GUI_comment[global.GUIs] = ""

global.GUI_hscroll_id[global.GUIs] = -1
global.GUI_vscroll_id[global.GUIs] = -1

global.GUI_maxvalue[global.GUIs] = 100

//runtime vars for testing
global.GUI_value[global.GUIs] = 0
global.GUI_string[global.GUIs] = ""

global.GUIs++
return global.GUIs-1;
