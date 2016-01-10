///MELT_draw_text(x,y,string)

var melt_exists = instance_exists(MELT_control)

if melt_exists
if MELT_control.alarm[0] = 1
    {
    //MELT INTERFACES!!!
    with MELT_control
        {
        new = MELT_scr_gui_add(argument0,argument1,string_width(argument2) + 16,32,"gui_text")
        global.GUI_text[new] = argument2
        global.GUI_halign[new] = MELT_draw_get_halign()
        global.GUI_valign[new] = MELT_draw_get_valign()
        }
    repeat(10)
    effect_create_above(ef_cloud,argument0+random(20)-10,argument1+random(20)-10,0,c_dkgray)
    }
    
var ok = 1
if melt_exists
if MELT_control.melted
ok = 0

if ok
    {    
    draw_text(argument0,argument1,argument2)
    }
