///MELT_draw_background(background,x,y,w,h)

var melt_exists = instance_exists(MELT_control)

if melt_exists
if MELT_control.alarm[0] = 1
    {
    //MELT INTERFACES!!!
    with MELT_control
        {
        new = MELT_scr_gui_add(argument1,argument2,argument3,argument4,"gui_background")
        //global.GUI_text[new] = argument5
        
        //global.GUI_x[new] = argument1 + argument3 / 2
        //global.GUI_y[new] = argument2 + argument4 / 2
        global.GUI_spr[new] = argument0
        }
    repeat(10)
    effect_create_above(ef_cloud,argument1+random(20)-10,argument2+random(20)-10,0,c_dkgray)
    }
    
var ok = 1
if melt_exists
if MELT_control.melted
    {
    ok = 0
    }

if ok
    {
    draw_background_stretched(argument0,argument1-argument3/2,argument2-argument4/2,argument3,argument4)
    }
